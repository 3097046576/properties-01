<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user==null}">
    <script>
        $(function () {
            $("#login").click(function () {
                window.location.href = "user/login.html";
            });
        });
    </script>
</c:if>
<script>
    $(function () {

        $("#user_modify").click(function () {
            window.location.href = "user/<%=System.currentTimeMillis()%>/modify.html";
        });
        $("#user_source").click(function () {
            window.location.href = "user/<%=System.currentTimeMillis()%>/source.html";
        });
        $("#user_logout").click(function () {
            $.ajax({
                url: "user/<%=System.currentTimeMillis()%>/logout.json",
                type: "post",
                dataType: "json",
                async: false,
                success: function (request) {
                    var news = $(".news");
                    news.addClass("alert_success");
                    news.html(request.news);
                    news.css("display", "block");
                    window.setTimeout(function () {
                        news.css("display", "none");
                        window.location.href = "user/login.html";
                    }, 500);
                }
            });
        });
    });


</script>

<div class="head">
    <h1 class="welcome">欢迎</h1>
    <ul>
        <li><a href="index.html">首页</a></li>
    </ul>
    <div class="search">
        <input type="text" placeholder="搜索一下" id="search">
        <button type="button" id="searchButton">搜索</button>
    </div>
    <c:choose>
        <c:when test="${ user==null }">
            <div id="login">登录</div>
        </c:when>
        <c:when test="${ user.account !=null && user.password !=null }">
            <div class="user">
                <ul>
                    <li id="user_name">${user.userData.name}</li>
                    <li id="user_modify">个人信息</li>
                    <li id="user_source">我的资源</li>
                    <li id="user_logout" style="border: none;">退出登录</li>
                </ul>
            </div>
        </c:when>
    </c:choose>
</div>