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
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
</head>
<body>

<div class="source">
    <div class="imgNum">
        <div><strong>图片区</strong>当前拥有${allSource[0]==null?1024:allSource[0]}张图片</div>
    </div>
    <div class="fontNum">
        <div><strong>文字区</strong>当前拥有${allSource[1]==null?1024:allSource[1]}篇作品</div>
    </div>
    <div class="musicNum">
        <div><strong>音乐区</strong>当前拥有${allSource[2]==null?1024:allSource[2]}个站点</div>
    </div>
    <div class="moviesNum">
        <div><strong>影视区</strong>当前拥有${allSource[3]==null?1024:allSource[3]}个站点</div>
    </div>
</div>

</body>
</html>
