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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-masonry.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

</head>

<body>

<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<div class="container">
    <div class="row" id="main-content">
        <div class="col-md-3" id="last-news">
            <%@include file="/WEB-INF/jspf/news-last.jspf" %>
        </div>
        <div class="col-md-9" id="news">

            <jsp:include page="/WEB-INF/jspf/news-archive.jspf" flush="true"/>

        </div>
    </div>
</div>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/salvattore.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/comeback.js" type="text/javascript"></script>
</body>

</html>
