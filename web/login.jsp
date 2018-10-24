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
        <form class="form-signin" method="post" action="/login">
            <h2 class="form-signin-heading">Log in</h2>
            <input type="text" id="inputLogin" name="login" class="form-control" placeholder="Login" required autofocus>
            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password"
                   required>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
        </form>
    </div>
</div>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

</body>

</html>
