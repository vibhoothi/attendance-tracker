<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>AmritaNews</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
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
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address">
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password">
            <label for="confirmPassword" class="sr-only">Confirm password</label>
            <input type="password" id="confirmPassword" name="conf_password" class="form-control" placeholder="Confirm password">
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
  
  if (email != null && !email.isEmpty() && pass != null && !pass.isEmpty()) {
        try {
                Class.forName("org.gjt.mm.mysql.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/news", "root", "amma");
                Statement stmt = conn.createStatement();
                stmt.executeUpdate("insert into users values('"+email+"','"+pass+"')");
                out.println("Registered Successfully");
                stmt.close();

        }
        catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }
  }
          

%>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/salvattore.min.js"></script>
</body>

</html>
