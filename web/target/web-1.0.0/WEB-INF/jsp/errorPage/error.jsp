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
<html>
<head>
    <title>error</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <script src="webjars/jquery/3.6.0/dist/jquery.js"></script>
    <base href="<%=base%>">
    <style>
        h1{
            margin: 100px auto;
            font-size: 30px;
            width: 500px;
            height: 60px;
            text-align: center;
            line-height: 60px;
        }
        h3{
            margin: 0 auto;
            transition: all 1s;
            width: 200px;
            height: 60px;
            text-align: center;
            line-height: 60px;
        }
        h3:hover{font-size: 25px;}

    </style>
</head>
<body>

<h1>
    ${error}
</h1>
<h3 onclick="window.history.go(-1);">
    回到上一步
</h3>

</body>
</html>
