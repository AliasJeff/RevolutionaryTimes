<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-9
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>发布文章</title>
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
</head>
<style>
    section {
        background: rgba(255, 255, 255, 0.7);
        margin: 0 auto 35px;
        padding: 15px;
        width: 800px;
        overflow: hidden;
        border-radius: 15px;
    }

    .form-title {
        margin: 30px;
        width: 740px;
        font-size: 30px;
        font-weight: bold;
        font-family: 微软雅黑;
        border-style: hidden;
        background: none;
    }

    .form-content {
        font-size: 20px;
        margin: 30px;
        width: 740px;
        height: 750px;
        border-style: hidden;
        background: none;
    }

    .control {
        left: 0;
        width: 100%;
        position: fixed;
        z-index: 1000;
        bottom: 100px;
        height: 60px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        transform: translateY(100px);
        background-color: rgba(255, 255, 255, 0.7);
    }

    .control ul {
        width: 600px;
        height: 100%;
        position: absolute;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        right: 20%;
    }

    .control ul li {
        height: 35px;
        width: 90px;
        text-align: center;
    }

    .control ul li button {
        color: #000;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 35px;
        text-align: center;
        font-size: 18px;
        border: none;
        background: none;
    }

    .control ul .navbox {
        position: absolute;
        bottom: 1px;
        left: 360px;
        width: 115px;
        height: 5px;
        border-radius: 2px;
        background-color: #eb7350;
        z-index: -999;
        transition: .5s;
    }

    .control ul li:nth-child(1):hover ~ .navbox {
        left: 120px;
        background-color: red;
    }

    .control ul li:nth-child(2):hover ~ .navbox {
        left: 360px;
        background-color: red;
    }

</style>
<body>
<script>
    let msg = "${msg}";
    if(msg !== "")
        alert(msg)
</script>
<%--顶部导航栏--%>
<div class="shell">
    <div class="shell-main">
        <div class="shell-main-nav" style="margin-bottom: 50px;">
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
        <form id="formArticle" action="" method="post">
            <section>
                <div class="form">
                    <input autocomplete="off" type="text" class="form-title" id="art-title" name="art-title" placeholder="请输入文章标题（5~100个字）" required>
                </div>
                <hr/>
                <div class="form">
                    <textarea class="form-content" id="art-content" name="art-content" rows="10" cols="10" required></textarea>
                </div>
            </section>
            <input type="hidden" id="date" name="date">
            <div class="control">
                <ul>
                    <li>
                        <%--TODO: 保存草稿功能--%>
                        <button id="saveDraft" onclick="saveDraft()">保存草稿</button>
                    </li>
                    <li>
                        <%--TODO: 添加封面、添加标签--%>
                        <button id="postButton" onclick="postArticle()">发布文章</button>
<%--                        <button id="postButton" onclick="this.form.action='/postArticle'; this.form.submit();">发布文章</button>--%>
                    </li>
                    <div class="navbox"></div>
                </ul>
            </div>
        </form>
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
    var form = document.getElementById("formArticle")

    var today = new Date();
    var day = today.getDay();
    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date+' '+time;
    document.getElementById("date").innerHTML = dateTime;
    document.getElementById("date").value = dateTime;

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

    function postArticle() {
        if(username === "null") {
            alert("未登录，请先登录！");
        } else {
            if(document.getElementById("art-title").value != null && document.getElementById("art-content").value != null){
                form.action="/postArticle";
                form.submit();
                alert("发布成功！");
            } else {
                alert("请填写标题或正文！");
            }
        }
    }

    function saveDraft() {
        alert("功能正在开发中……")
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
