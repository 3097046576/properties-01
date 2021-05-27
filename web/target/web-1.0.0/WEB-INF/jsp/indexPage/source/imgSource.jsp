
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String base = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<html>
<head>
    <title>图片资源</title>
    <base href="<%=base%>">
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <script src="js/index.js" charset="utf-8"></script>
</head>
<body>

<div class="all">
    <c:forEach var="img" items="${imgList}">
        <img src="${img.data}" height="100px">
    </c:forEach>
</div>

<div class="news"></div>
</body>
</html>
