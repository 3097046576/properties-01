
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String base = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<html>
<head>
    <title>图片资源</title>
    <base href="<%=base%>">
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <script src="js/index.js" charset="utf-8"></script>
</head>
<body>

<div class="source">
    <div class="imgNum">
        <div><strong>您的图片区</strong>当前拥有${mySource[0]==null?0:mySource[0]}张图片</div>
    </div>
    <div class="fontNum">
        <div><strong>您的文字区</strong>当前拥有${mySource[1]==null?0:mySource[1]}篇作品</div>
    </div>
    <div class="musicNum">
        <div><strong>您的音乐区</strong>当前拥有${mySource[2]==null?0:mySource[2]}个站点</div>
    </div>
    <div class="moviesNum">
        <div><strong>您的影视区</strong>当前拥有${mySource[3]==null?0:mySource[3]}个站点</div>
    </div>
</div>
</div>

<div class="news"></div>
</body>
</html>
