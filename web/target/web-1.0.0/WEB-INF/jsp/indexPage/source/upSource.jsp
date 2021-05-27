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
    <title>资源上传</title>
    <base href="<%=base%>">

    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <style>
        #upFile{
            width: 300px;
            height: 400px;
            margin: auto;
            padding: 50px;
            text-align: center;
            line-height: 400px;
        }
        #file{
            display: block;
            width: 200px;
            height: 40px;
            line-height: 35PX;
            background-color: red;
            border: yellow solid;
        }
        #button{
            margin-top: 50px;
            width: 80px;
            height: 40px;
        }
    </style>
</head>
<body>

<form method="post" action="user/<%=System.currentTimeMillis()%>/${user.id}/upSource.html" id="upFile" enctype="multipart/form-data">
    <input type="file" multiple="multiple" name="userFile" id="file">
    <input type="submit" id="button">
</form>

<div class="news"></div>
</body>
</html>
