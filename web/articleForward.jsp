<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-13
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title}</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/comment.css">
    <style>
        body .shell-main-nav ul .nav-box {
            left: 360px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            /*background-color: rgb(248, 248, 248);*/
            background-color: rgb(241,244,223);
            background-repeat: no-repeat;
            background-size: contain;
        }

        body .shell-main-nav {
            margin-bottom: 0;
        }

        .main {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            max-width: 1430px;
            overflow-x: hidden;
            transform: translateY(0px);
            background-color: #fff;
            transition: .3s;
            padding: 50px;
            border: 1px solid #000;
        }

        .img {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background-attachment: fixed;
            background-size: 100%;
            background-repeat: no-repeat;
        }

        .img img {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background-attachment: fixed;
            background-size: 100%;
            background-repeat: no-repeat;
        }

        .headline {
            width: 500px;
            height: 200px;
            border-radius: 3px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border: #fff 10px solid;
            color: #fff;
            letter-spacing: 30px;
            font: 100 70px 'font';
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 888;
        }

        /* -------------------------------------- */

        .section-top {
            width: 100%;
            height: 60px;
            display: flex;
            justify-content: space-evenly;
            margin-top: 50px;
        }

        .section-top-middle {
            width: 400px;
            height: 60px;
        }

        .section-top-right {
            width: 400px;
            height: 60px;
            font-size: 18px;
        }

        .section-top a {
            font-size: 18px;
            color: #22A39F;
        }

        .section-middle,
        .section-bottom {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .section-bottom {
            position: relative;
        }

        .section-middle .content {
            width: 70%;
        }

        .section-middle-box {
            width: 100%;
            display: flex;
            margin: 50px 0;
        }

        .section-middle-left {
            width: 600px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .section-middle-left span {
            text-align: left;
            color: rgb(241, 167, 167);
            margin-top: 10px;
        }

        .section-middle-right {
            width: 600px;
            display: flex;
            justify-content: center;
        }

        .section-middle-right img {
            width: 400px;
        }

        .section-middle-left span {
            text-align: center;
            font-size: 20px;
        }

        .Skills {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-evenly;
            margin: 40px 0;
        }

        .Skills li {
            width: 50%;
            display: flex;
            justify-content: space-evenly;
            margin: 20px 0;
            height: 50px;
            cursor: pointer;
        }

        .Skills li span,
        .Skills li p {
            text-align: center;
            font-size: 20px;
            display: block;
            width: 50%;
            transition: .2s;
            letter-spacing: 0px;
        }

        .Skills li p {
            color: #22A39F;
        }

        .Skills li:hover p {
            letter-spacing: 5px;
        }

        .Achievement {
            margin-top: 40px;
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        .Achievement-left {
            display: flex;
            flex-direction: column;
            width: 300px;
        }

        .Achievement-left h2 {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .Achievement-left span {
            font-size: 10px;
        }

        .Achievement-right {
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
            width: 450px;
        }

        .Achievement-right img {
            width: 200px;
            margin-left: 20px;
            margin-bottom: 20px;
            transition: .3s;
        }

        .Achievement-right img:hover {
            transform: scale(1.1);
        }

        article {
            display: flex;
            justify-content: center;
        }

        aside {
            width: 100%;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: rgb(240, 240, 224);
            padding: 50px 0;
        }

        .bottom {
            width: 1300px;
            display: flex;
            justify-content: space-between;
            position: relative;
        }

        .bottom::after {
            content: 'QQ:10086';
            position: absolute;
            top: -170px;
            width: 100%;
            text-align: center;
            font: 300 40px '';
        }

        .bottom img {
            width: 23%;
            height: 300px;
        }
    </style>
</head>

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
        <div class="img" id="img">
            <img id='articleCover' src='./image/image/2.png'>
            <div class='headline' id='headline'>${article.title}</div>
        </div>
        <div class="main">
            <section>
                <div class="section-top">
                    <div class="section-top-middle">
                        <a>阅读：</a><a class="view" id="view">${article.view}</a>
                        <a>点赞：</a><a class="like" id="like">${article.like}</a>
                        <a>收藏：</a><a class="collect" id="collect">${article.collect}</a>
                    </div>
                    <div class="section-top-right">
                        <a>发布时间：</a><a class="date" id="date">${article.date}</a>
                        <a>作者：</a><a class="author" id="author">${article.uname}</a>
                    </div>
                </div>
                <div class="section-middle">
                    <span class="content" id="content">${article.content}</span>
                </div>
            </section>
        </div>

        <div class="comment">
            <div class="frame">
                <div class="record">头像</div>
                <div class="arc"></div>
                <div class="box">
                    <textarea id="textComment" name="textComment" placeholder="发表一条评论吧"></textarea>
                </div>
                <a><span class="oButton" href="javascript:;" onclick="issueComment()">发表评论</span></a>
            </div>
            <div class="show">
                <div class="tl">评论</div>
                <div class="people">
                    <img class="l" src="img/h2.jpg" >
                    <span class="issuer" id="issuer">骑着蜗牛去旅行</span>
                    <span class="issue" id="issue">测试留言</span>
                    <span class="time" id="time">2020年3月21日</span>
                    <a class="a3"><span class="reply" href="javascript:;" onclick="reply()">回复</span></a>
                </div>
            </div>
        </div>
        <div class="shell-main-footer">
            <span>我是底边栏</span>
        </div>
    </div>

</div>
<script>
    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";

    if(username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "欢迎，" + username;
        login.href = "./userInfo.jsp";
    }


</script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.5.1.min.js"></script>
<script>
    <%
    //获取当前请求的上一个URL，即访问登陆页面前的URL
    String preUrl = request.getRequestURL().toString();
    session.setAttribute("preUrl",preUrl);
    %>

    window.addEventListener('scroll', function () {
        let top = window.scrollY
        console.log(top)
        if (top > 200) {
            $('.main').css('transform', 'translateY(-300px)')
        } else {
            $('.main').css('transform', 'translateY(0%)')
        }
    })
</script>
</body>

</html>