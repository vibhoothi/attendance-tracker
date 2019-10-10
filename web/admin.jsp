<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Details</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-masonry.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@include file="/WEB-INF/jspf/navbar.jspf" %>
<%
    String cur = (String) session.getAttribute("user");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select user.name from user, admin where user.name = admin.name;");
    int flag = 0;
    while (rs.next()) { 
        String name = rs.getString("name");
        System.out.println(name);
        System.out.println(cur);
        if (name.equals(cur)) {
            flag = 1;
            break;
        }
    }
    if(flag != 1) {
        String redirectURL = "/index.jsp";
        response.sendRedirect(redirectURL);
    }
%>

<div class="container">
        <div class="row" id="main-content">
            <form class="form-register" method="post">
                <h2 class="form-register-heading">Mark Attendance</h2>
                <input type="text" id="inputName" name="name" class="form-control" placeholder="Name">
                <br/>
                <input type="date" id="inputdate" name="date" class="form-control" placeholder="Date">
                <br/>
                 <center>
                <input type="checkbox" style="zoom:2;" id="inputAttendance" name="attendance" value="Present" placeholder="Present">
                <label for="Present">Check if student present</label>
                 </center>
                <br/>
                <button class="btn btn-lg btn-success btn-block" type="submit">Mark Attendance</button>
            </form>
        </div>
    </div>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%    
    String email = request.getParameter("name");
    String pass[] = request.getParameterValues("attendance");
    String date = request.getParameter("date");
    
    if (email != null && !email.isEmpty()) {
        try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("select * from user where name='" + email + "'");
                int attendance = 0;
                int total = 0;
                int ispresent = 0;
                while (rs.next()) { 
                    attendance = rs.getInt("attendance");
                    total = rs.getInt("total");
                }
                if(pass != null && pass.length != 0) {
                    ispresent = 1;
                    attendance = attendance + 1;
                }
                total = total + 1;
                stmt.executeUpdate("update user set attendance=" + String.valueOf(attendance) + " where name='" + email + "'");
                stmt.executeUpdate("update user set total=" + String.valueOf(total) + " where name='" + email + "'");
                stmt.execute("insert into attendance(name, date, ispresent) values('"+ email +"','" + date + "'," + String.valueOf(ispresent)+ ")");
                stmt.close();
                //session.setAttribute("user", email);
                String redirectURL = "/index.jsp";
                response.sendRedirect(redirectURL);

        }
        catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }
  }

%>
<%@include file="/WEB-INF/jspf/footer.jspf" %>



<script src="${pageContext.request.contextPath}/js/salvattore.min.js"></script>
</body>

</html>
