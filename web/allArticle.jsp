<%@ page import="com.zhexun.entity.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-16
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>全部文章</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/allArticle.css">
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
<body>
<script>
    let msg = "${msg}";
    if(msg !== "")
        alert(msg)
</script>
<div class="shell">
    <div class="shell-main">
        <div class="shell-main-nav">
            <div class="logo">
                <img src="./image/flag.png" alt="">
                <span>旌旗在望</span>
            </div>
            <div class="search">
                <span class="icon">🔍</span>
                <input id="search-input" name="search-input" placeholder="搜索文章的标题或内容">
                <a class="searchButton" href="javascript:;" onclick="toSearch()">搜索</a>
            </div>
            <ul class="layui-nav">
                <li><a href="./index.jsp">首页</a></li>
                <li><a href="javascript:;" onclick="toUserInfo()">个人中心</a></li>
                <li><a href="/reloadAllArticle">查看更多</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">发布/上传</a>
                    <dl class="layui-nav-child">
                        <dd><a href="./postArticle.jsp">发布文章</a></dd>
                        <dd><a href="./postCourse.jsp">上传课程</a></dd>
                        <dd><a href="./postPicture.jsp">上传图片</a></dd>
                    </dl>
                </li>
                <li><a id="login" href="./login.jsp"> <%--js--%> </a></li>
                <div class="nav-box"></div>
            </ul>
        </div>

        <div class="collocation">
            <div class="title">
                <h2>文章</h2>
            </div>
            <ul class="list">
                <c:forEach items="${articles}" var="article">
                    <li>
                        <img src="./image/xinqingnian.jpg" alt="封面">
                        <div class="description">
                            <h3><a href="/reloadArticle?Article=${article.articleid}">${article.title}</a></h3>
                            <p>作者: ${article.uname}&nbsp;日期: ${article.date}</p>
                            <p>阅读: ${article.view}&nbsp;获赞: ${article.like}&nbsp;收藏: ${article.collect}</p>
                            <p>${article.content}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="collocation">
            <div class="title">
                <h2>图片和视频</h2>
            </div>
            <ul class="list">
                <c:forEach items="${pictures}" var="picture">
                    <li>
                        <%--TODO: 不知道为什么显示不出来--%>
                        <img src="<%=request.getRealPath("/images") + "\\"%>${picture.pname}" alt="">
                        <div class="description">
                            <p>作者: ${picture.uname}&nbsp;日期: ${picture.date}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <div class="shell-main-footer">
            <span>旌旗在望，鼓角相闻</span>
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

    if (username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        let html = "<li class='layui-nav-item'>" +
            "<a href='/reloadUserInfo'>欢迎," + username + "</a>" +
            "<dl class='layui-nav-child'>" +
            "<dd><a href='reloadUserInfo'>个人中心</a></dd>" +
            "<dd><a href='./logout.jsp'>退出登录</a></dd>" +
            "</dl>";
        login.innerHTML = html;
    }

    function toSearch() {
        var content = document.querySelector('[name="search-input"]').value;
        if(content === null || content === "") {
            alert("请输入搜索内容！")
        } else {
            window.location.href = "/search?content=" + content;
        }
    }

    function toUserInfo() {
        if(username === "null") {
            alert("未登录，请先登录！")
        } else {
            window.location.href = "/reloadUserInfo";
        }
    }
</script>
<script src="layui/layui/layui.js"></script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //导航点击事件
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
</html>
