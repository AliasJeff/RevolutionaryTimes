<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-9
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布文章</title>
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/nav.css">
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
<%--顶部导航栏--%>
<div class="shell">
    <div class="shell-main">
        <div class="shell-main-nav" style="margin-bottom: 50px;">
            <div class="logo">
                <img src="./image/image/logo.jpg" alt="">
                <span>旌旗在望</span>
            </div>
            <ul>
                <li><a href="./index.jsp">首页</a></li>
                <li><a href="./userInfo.jsp">个人中心</a></li>
                <li><a href="./make.html">xxxx</a></li>
                <li><a href="./postArticle.jsp">发布文章</a></li>
                <li><a id="login" href="./login.jsp"></a></li>
                <div class="nav-box"></div>
            </ul>
        </div>
        <%--TODO: 支持markdown--%>
        <form id="form1" action="" method="post">
            <section>
                <div class="form">
                    <input type="text" class="form-title" id="art-title" name="art-title" placeholder="请输入文章标题（5~100个字）" required>
                </div>
                <hr/>
                <div class="form">
                    <textarea class="form-content" id="art-content" name="art-content" rows="10" cols="10" required></textarea>
                </div>
            </section>
            <div class="control">
                <ul>
                    <li>
                        <%--TODO: 保存草稿功能--%>
                        <button id="saveDraft">保存草稿</button>
                    </li>
                    <li>
                        <%--TODO: 下面的js无法调用，上传时间功能、添加封面、添加标签--%>
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
    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";
    var form = document.getElementById("form1")

    if (username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "当前用户：" + username;
        login.href = "./userInfo.jsp";
    }

    function postArticle() {
        if(username === "null") {
            alert("请先登录！");
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

</script>
</html>
