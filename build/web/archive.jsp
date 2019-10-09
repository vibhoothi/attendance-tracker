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
<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<div class="container">
        <div class="row" id="main-content">
            <form class="form-register" method="post">
                <h2 class="form-register-heading">Mark Attendence</h2>
                <input type="text" id="inputName" name="name" class="form-control" placeholder="Name">
                <input type="checkbox" id="inputAttendance" name="attendance" class="form-control" value="Present">
                <br/>
                <button class="btn btn-lg btn-success btn-block" type="submit">Mark Attendence</button>
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
    ResultSet adminCheck = stmt.executeQuery("select * from user, admin where user.name=admin.name");
    if (email != null && !email.isEmpty()) {
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from user where name='" + email + "'");
                int attendance = 0;
                int total = 0;
                while (rs.next()) { 
                    attendance = rs.getInt("attendance");
                    total = rs.getInt("total");
                }
                if(pass != null && pass.length != 0) {
                    attendance = attendance + 1;
                }
                total = total + 1;
                stmt.executeUpdate("update user set attendance=" + String.valueOf(attendance) + " where name='" + email + "'");
                stmt.executeUpdate("update user set total=" + String.valueOf(total) + " where name='" + email + "'");
                stmt.close();
                session.setAttribute("user", email);
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
