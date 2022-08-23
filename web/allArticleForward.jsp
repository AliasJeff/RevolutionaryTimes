<%@ page import="com.zhexun.entity.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-16
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>全部文章</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
<body>
<div class="shell">
    <div class="shell-main">
        <div class="shell-main-nav">
            <div class="logo">
                <img src="./image/image/logo.jpg" alt="">
                <span>旌旗在望</span>
            </div>
            <ul>
                <li><a href="./index.jsp">首页</a></li>
                <li><a href="./userInfo.jsp">个人中心</a></li>
                <li><a href="./allArticle.jsp">全部文章</a></li>
                <li><a href="./postArticle.jsp">发布文章</a></li>
                <li><a id="login" href="./login.jsp"> <%--js--%> </a></li>
                <div class="nav-box"></div>
            </ul>


        </div>
        <div id="test">

        </div>




        <div class="shell-main-footer">
            <span>我是底边栏</span>
        </div>
    </div>

</div>
</body>
<script>
    <%
    //获取当前请求的上一个URL，即访问登陆页面前的URL
    String preUrl = request.getRequestURL().toString();
    session.setAttribute("preUrl",preUrl);
    %>

    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";

    if(username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "欢迎，" + username;
        login.href = "./userInfo.jsp";
    }
</script>
</html>
