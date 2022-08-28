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
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
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
            background-color: rgb(241, 244, 223);
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
        <%--TODO: 发表第二条内容空白，第三条uid无--%>
        <form id="commentForm" method="post" action="" autocomplete="off">
            <div class="comment">
                <div class="frame">
                    <div class="record">头像</div>
                    <div class="arc"></div>
                    <div class="box">
                        <textarea id="textComment" name="textComment" placeholder="发表一条评论吧~"></textarea>
                    </div>
                    <a href="javascript:;" style="right: 25px"><span class="oButton"
                                                 onclick="issueComment(${article.articleid})">发表评论</span></a>
                </div>
                <div class="show">
                    <div class="tl">评论</div>
                    <%--TODO: 显示的顺序问题--%>
                    <c:forEach items="${comments}" var="comment">
                        <c:if test="${comment.uoid == null || comment.uoid == 0}">
                            <div class="people">
                                <img class="l" src="img/h2.jpg" alt="头像">
                                <span class="issuer" <%--id="issuer"--%>>${comment.uname}:</span>
                                <span class="issue" <%--id="issue"--%>>${comment.commentContent}</span>
                                <span class="time" <%--id="time"--%>>${comment.date}</span>
                                <a class="a4"><input name="textComment" placeholder="发表一条评论吧~"></a>
                                <a class="a3" href="javascript:;"><span class="reply"
                                                    onclick="reply(${comment.uid}, ${article.articleid})">回复</span></a>
                            </div>
                        </c:if>
                        <c:if test="${comment.uoid != null && comment.uoid > 0}">
                            <div class="people">
                                <img class="l" src="img/h2.jpg" alt="头像">
                                <br/>
                                <span class="issuer" <%--id="issuer"--%>>${comment.uname}回复${comment.uoname}:</span>
                                <span class="issue" <%--id="issue"--%>>${comment.commentContent}</span>
                                <span class="time" <%--id="time"--%>>${comment.date}</span>
                                <a class="a4"><input name="replyContent" placeholder="发表一条评论吧~"></a>
                                <a class="a3" href="javascript:;"><span class="reply"
                                                    onclick="reply(${comment.uid}, ${article.articleid})">回复</span></a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </form>
        <div class="shell-main-footer">
            <span>旌旗在望，鼓角相闻</span>
        </div>
    </div>

</div>
<script>
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

    var today = new Date();
    var day = today.getDay();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    /*TODO: 缺少数字0*/
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date + ' ' + time;

    function toUserInfo() {
        if (username === "null") {
            alert("未登录，请先登录！")
        } else {
            window.location.href = "/reloadUserInfo";
        }
    }

    function toSearch() {
        var content = document.querySelector('[name="search-input"]').value;
        if(content === null || content === "") {
            alert("请输入搜索内容！")
        } else {
            window.location.href = "/search?content=" + content;
        }
    }

    function issueComment(id) {
        if (username === "null") {
            alert("未登录，请先登录！")
        } else {
            document.getElementById("commentForm").action = "/issueComment?id=" + id + "&date=" + dateTime
            document.getElementById("commentForm").submit()
            // window.location.href = "/issueComment?id=" + id + "&date=" + dateTime;
        }
    }

    function reply(uoid, id) {
        if (username === "null") {
            alert("未登录，请先登录！")
        } else {
            document.getElementById("commentForm").action = "/issueComment?uoid=" + uoid + "&id=" + id + "&date=" + dateTime
            document.getElementById("commentForm").submit()
            // window.location.href = "/issueComment?uoid=" + uoid + "&id=" + id + "&date=" + dateTime;
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