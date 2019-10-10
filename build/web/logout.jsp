<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Attendance Tracker</title>
    <h2><center> Successfully logged out </h2>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>
<% session.removeAttribute("user");  %>
<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<%@include file="/WEB-INF/jspf/footer.jspf" %>


<script src="${pageContext.request.contextPath}/js/comeback.js" type="text/javascript"></script>
</body>

</html>
