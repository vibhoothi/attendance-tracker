<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Archive AmritaNews</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-masonry.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>
<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<div class="container">
    <div class="row" id="news-archive">
        <%@include file="/WEB-INF/jspf/news-archive.jsp" %>
    </div>
</div>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script src="${pageContext.request.contextPath}/js/salvattore.min.js"></script>
</body>

</html>
