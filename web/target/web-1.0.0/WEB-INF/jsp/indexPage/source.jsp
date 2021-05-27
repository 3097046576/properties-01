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
    <title>我的资源</title>
    <base href="<%=base%>">
    <link rel="stylesheet" type="text/css" href="css/public.css" />
    <link rel="stylesheet" type="text/css" href="css/publicHead.css" />
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <style>
        .left{
            float: left;
            width: 15%;
            height: 100%;
        }
        .right{
            float: left;
            width: 85%;
            height: 100%;
        }
        .left>ul>li{
            width: 100%;
            height:40px;
            text-align: center;
            line-height: 40px;
            border-bottom: 1px solid #ccc;
            background-color: #e7faf0;
            color: #13ce66;
            transition: height 0.5s;
            overflow: hidden;
        }
        .left li:nth-child(n+2):hover{
            background-color: greenyellow;
        }
        #mySource ul>li{
            width: 100%;
            height: 40px;
            line-height: 40px;
            border-bottom: #cccccc solid 1px;
        }
        #mySource:hover{
            height: 200px;
        }
    </style>
    <script>
        $(function (){
            $("#allSource").click(function (){
                var page = $("#page");
                page.attr("src","user/<%=System.currentTimeMillis()%>/${user.id}/mySource.html");
            });
            $("#imgSource").click(function (){
                var page = $("#page");
                page.attr("src","user/<%=System.currentTimeMillis()%>/${user.id}/imgSource.html");
            });
            $("#upSource").click(function (){
                var page = $("#page");
                page.attr("src","user/<%=System.currentTimeMillis()%>/upSource.html");
            });
        });
    </script>
</head>
<body>

<jsp:include page="../publicPage/publicHead.jsp"></jsp:include>
<div class="main">
    <div class="left">
        <ul>
            <li id="mySource">
                <ul>
                    <li id="allSource">我的资源</li>
                    <li id="imgSource">图片资源</li>
                    <li id="fontSource">文字资源</li>
                    <li id="musicSource">音乐资源</li>
                    <li id="moviesSource">影视资源</li>
                </ul>
            </li>
            <li id="upSource">上传资源</li>
        </ul>
    </div>
    <div class="right">
        <iframe id="page" src="user/<%=System.currentTimeMillis()%>/${user.id}/mySource.html"
                frameborder="0" width="100%" height="100%">

        </iframe>
    </div>
</div>



</body>
</html>
