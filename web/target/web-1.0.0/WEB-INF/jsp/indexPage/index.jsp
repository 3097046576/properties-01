<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/4 0004
  Time: 下午 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String base = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragrma","no-cache");
    response.setDateHeader("Expires",0);
%>
<html>
<head>
    <title>首页</title>
    <base href="<%=base%>">

    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" type="text/css" href="css/publicHead.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <script src="js/index.js" charset="utf-8"></script>
</head>
<body>

<jsp:include page="../publicPage/publicHead.jsp"></jsp:include>

<div class="main">
    <div class="left">
        <ul class="region">
            <li>娱乐分区</li>
            <li>图片区</li>
            <li>文字区</li>
            <li>音乐区</li>
            <li>影视区</li>
            <li>其他</li>
        </ul>
    </div>
    <div class="right">
        <iframe src="main.html" width="100%" height="100%" frameborder="0"></iframe>
    </div>
</div>

<div class="news"></div>


</body>
</html>
