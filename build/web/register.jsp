<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Attendance Tracker</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">


</head>

<body>

<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<div class="container">
    <div class="row" id="main-content">
        <form class="form-register" method="post">
            <h2 class="form-register-heading">Sign up</h2>
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address">
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password">
            <input type="password" id="confirmPassword" name="conf_password" class="form-control" placeholder="Confirm password">
           <input list="category" name="category" class="form-control" placeholder="Batch">
            <datalist id="category">
              <option value="2019">
              <option value="2018">
              <option value="2017">
              <option value="other">
            </datalist>
            <br/>
            <button class="btn btn-lg btn-success btn-block" type="submit">Create an account</button>
        </form>
    </div>
</div>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%
  String email = request.getParameter("email");
  String pass = request.getParameter("password");
  String category = request.getParameter("category");
  
  if (email != null && !email.isEmpty() && pass != null && !pass.isEmpty()) {
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
                Statement stmt = conn.createStatement();
                stmt.executeUpdate("insert into user(email, password, category) values('"+email+"','"+pass+"','"+category+"')");
                stmt.close();
                session.setAttribute("user", email);
                String redirectURL = "/NewsPortal/user.jsp";
                response.sendRedirect(redirectURL);

        }
        catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }
  }
          

%>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

</body>

</html>
