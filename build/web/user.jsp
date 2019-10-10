<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Attendance Tracker</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>
<div class="col-md-12" id="center">
    
<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%
   String email = (String) session.getAttribute("user");
   
  if (email != null && !email.isEmpty()) {
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from user where name ='"+email+"'");
                int attendance = 0;
                int total = 0;
                while (rs.next()) { 
                    attendance = rs.getInt("attendance");
                    total = rs.getInt("total");
                    final DefaultPieDataset data = new DefaultPieDataset();
                    data.setValue("Present", attendance);
                    data.setValue("Absent", total - attendance);
                    JFreeChart chart = ChartFactory.createPieChart("Pie Chart ", data, true, true, false);
                    String file = "/img/pie/pie-" + email + ".png";
                    String filename = "pie-" + email + ".png"; 
                    try {
                        final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                         //out.println(getServletContext().getRealPath("."));
                         final File file1 = new File(getServletContext().getRealPath(".") + file);
                         ChartUtils.saveChartAsPNG(file1, chart, 600, 400, info);
                    } catch (Exception e) {
                         System.out.println(e);
                    }
                    %>
            <div class="item">
            <div class="thumbnail">
                <p class="text-center article-img">
                    <img src="" alt="" class="img-responsive">
                </p>
                <div class="caption">
                    <h3><%= email %></h3>           
                    <img SRC=<%= file %> WIDTH="600" HEIGHT="400" 
   BORDER="0" USEMAP="#chart">
                    
                </div>
            </div>

        </div>
                    <%
                    
                }
                stmt.close();
        }
                catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }
  }          

%>
    
</div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>


<script src="${pageContext.request.contextPath}/js/comeback.js" type="text/javascript"></script>
</body>

</html>
