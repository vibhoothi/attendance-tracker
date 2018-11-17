<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>AmritaNews</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>

<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<div class="container">
    <div class="row" id="main-content">
        <h3 class="text-center"> ${errorMessage}</h3>
        <form class="form-signin" method="post">
            <h2 class="form-signin-heading">Log in</h2>
            <input type="email" id="inputLogin" name="email" class="form-control" placeholder="Email" required autofocus>
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password"
                   required>
            <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
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
                ResultSet rs = stmt.executeQuery("select email from user where email = '" + email +"' and password = '" + pass + "'");
                if (rs.next()) {
                    String ret = rs.getString("email");
                    out.println(ret);
                    session.setAttribute("user", ret);
                    String redirectURL = "/NewsPortal/user.jsp";
                    response.sendRedirect(redirectURL);
                }
                
                else {
                    stmt.close();
                    out.println("Incorrect email or paasword");
                }               

        }
        catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }
  }
          

%>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

</body>

</html>
