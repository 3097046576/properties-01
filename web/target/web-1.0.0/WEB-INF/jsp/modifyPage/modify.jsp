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
    <link rel="stylesheet" type="text/css" href="css/modify.css">
    <link rel="stylesheet" type="text/css" href="css/publicHead.css">
    <script src="webjars/jquery/3.6.0/dist/jquery.js" charset="utf-8"></script>
    <script src="js/modify.js" charset="UTF-8"></script>
</head>
<body>

    <jsp:include page="../publicPage/publicHead.jsp"></jsp:include>

    <form method="get" action="user/<%=System.currentTimeMillis()%>/modify.json" >
        <input type="text" name="id" value="${user.userData.id}" style="display: none" >
        <ul id="user_data">
            <li>
                <span>名字</span>
                <input id="name" name="name" type="text" value="${user.userData.name}">
            </li>
            <li>
                <span>年龄</span>
                <input id="age" name="age" type="text" value="${user.userData.age}">
            </li>
            <li>
                <span>手机号</span>
                <input id="telephone" name="telephone" type="text" value="${user.userData.telephone}">
            </li>
            <li>
                <span>电子邮箱</span>
                <input id="e_mail" name="eMail" type="text" value="${user.userData.eMail}">
            </li>
            <li>
                <button type="submit">确认修改</button>
            </li>
        </ul>
    </form>
    <div id="tips">${news}</div>
    <div id="goIndex">
        <a href="index.html">回到首页</a>
    </div>

</body>
</html>
