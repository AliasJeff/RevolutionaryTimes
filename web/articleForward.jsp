<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-13
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <style>
        body .shell-main-nav ul .nav-box {
            left: 360px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: rgb(248, 248, 248);
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
                <li><a href="./login.jsp">登录/注册</a></li>
                <div class="nav-box"></div>
            </ul>
        </div>
        <div class="img" id="img">

        </div>
        <div class="main">
            <section>
                <div class="section-top">
                    <div class="section-top-middle">
                        <a>阅读：</a><a class="view" id="view"></a>
                        <a>点赞：</a><a class="like" id="like"></a>
                        <a>收藏：</a><a class="collect" id="collect"></a>
                    </div>
                    <div class="section-top-right">
                        <a>发布时间：</a><a class="date" id="date"></a>
                        <a>作者：</a><a class="author" id="author"></a>
                    </div>
                </div>
                <div class="section-middle">
                    <span class="content" id="content" ></span>
                    <div style="border-bottom:solid 1px #000; padding-bottom: 20px; width: 100%; display: flex; margin: 50px 0;"></div>
                    <div class="section-middle-box">
                        <div class="section-middle-left">
                            <span>Sep2020-Jun2021</span>
                        </div>
                        <div class="section-middle-right">
                                <span>See the interest on the way. Extend the road under your feet with stories.
                                    <br><br>

                                    See the interest in creating everything. Paint the stars and the sea in the distance
                                    with a brush.</span>
                        </div>
                    </div>

                    <div class="section-middle-box" style="border-bottom:solid 1px #000; padding-bottom: 20px;">
                        <div class="section-middle-left">
                            <span>Sep2021-Jun2022</span>
                        </div>
                        <div class="section-middle-right">
                                <span>See the interest in embracing dimensions. Use imagination to make cartoon
                                    characters and game protagonists jump
                                    On the paper.</span>
                        </div>
                    </div>
                </div>

            </section>
        </div>

        <div class="shell-main-footer">
            <span>我是底边栏</span>
        </div>
    </div>

</div>
<script>
    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";

    var uid = "<%=request.getAttribute("articleUid")%>";
    var author = "<%=request.getAttribute("articleUname")%>";
    var title = "<%=request.getAttribute("articleTitle")%>";
    var content = "<%=request.getAttribute("articleContent")%>";
    var date = "<%=request.getAttribute("articleDate")%>";
    var view = "<%=request.getAttribute("articleView")%>";
    var like = "<%=request.getAttribute("articleLike")%>";
    var collect = "<%=request.getAttribute("articleCollect")%>";
    var cover = "<%=request.getAttribute("articleCover")%>";

    document.title = title;

    var info = '';
    info = "<img id='articleCover' src='" + './image/image/2.png' + "'>" +
        "<div class='headline' id='headline'>" + title + "</div>";
    document.getElementById("img").innerHTML = info;

    document.getElementById("view").innerHTML = view;
    document.getElementById("like").innerHTML = like;
    document.getElementById("collect").innerHTML = collect;
    document.getElementById("date").innerHTML = date;
    document.getElementById("author").innerHTML = author;
    document.getElementById("content").innerHTML = content;

    if(username === "null") {  // TODO: 这段之后的js代码无效，原因未知，所以其他js放在此段的上面
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "欢迎，" + username;
        login.href = "./userInfo.jsp";
    }




</script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.5.1.min.js"></script>
<script>
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