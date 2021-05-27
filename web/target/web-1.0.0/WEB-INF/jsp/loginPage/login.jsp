<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/5/4 0004
  Time: 下午 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String base = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <title>login</title>
    <base href="<%=base%>">
    <link rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <script  type="text/javascript" src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/login.js" charset="utf-8"></script>
    <script>
        <c:if test="${proxyLogin == null }">
        $(function () {
            $.ajax({
                url: "user/proxyLogin.html",
                type: "post",
                dataType: "text",
                contentType: "text/html;charset=utf-8",
                success: function (request) {
                    if (request != null && request.length > 0) {
                        var data = request.split("#");
                        $("#proxyAcc").val(data[0]);
                        $("#proxyPassword").val(data[1]);
                        $("#proxy").submit();
                    }
                }
            });
        });
        </c:if>
        $(function (){
            function judge ( val ){
                if( val == null || val.length == 0){
                    return true;
                }
                return false;
            }
            $("#register").click(function (){
                var acc = $("#acc").val();
                var password = $("#password").val();
                if( judge(acc) || judge(password) ){
                    $("#tips").html("账号和密码不能为空!").css("color","red");
                    return false;
                }
                var sendPaswd = prompt("请再次输入密码");
                if( password != sendPaswd ){
                    $("#tips").html("两次密码不一致,请重新输入!").css("color","red");
                    return false;
                }
                $.ajax({
                    url:"user/<%=System.currentTimeMillis()%>/register.json",
                    type:"post",
                    dataType:"json",
                    data:{
                        acc:acc,
                        paswd:password
                    },
                    success:function ( request ){
                        var news = $(".news");
                        news.removeClass("alert_success");
                        news.removeClass("alert_fail");
                        if( request.judge == "true" ){
                            news.addClass("alert_success");
                        }else {
                            news.addClass("alert_fail");
                        }
                        news.html(request.news);
                        news.css("display","block");
                        window.setTimeout(function() {
                            news.css("display","none");
                        },2000);
                    }
                });
            });
        });
    </script>
</head>
<body>
<form id="proxy" action="user/<%=System.currentTimeMillis()%>/main.html" method="post" style="display: none;">
    <input type="text" name="userAcc" id="proxyAcc">
    <input type="password" name="userPassword" id="proxyPassword">
    <input type="text" name="proxyLogin" value="1">
</form>

<form method="post" action="user/<%=System.currentTimeMillis()%>/main.html">
    <div id="divAcc">
        <span class="text">账号: </span>
        <input id="acc" type="text" placeholder="请输入账号" name="userAcc">
    </div>
    <input type="text" name="proxyLogin" value="0" style="display: none">
    <div id="divPassword">
        <span class="text">密码: </span>
        <input id="password" type="password" placeholder="请输入密码" name="userPassword">
    </div>
    <div id="divButton">
        <input class="button" type="submit" value="登录"/>
        <button class="button" id="register" type="button">注册</button>
    </div>
</form>
<div class="news"></div>
</body>
</html>
