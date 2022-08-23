<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-18
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css">
</head>
<style>
    .box1 {
        width: 100%;
    }

    .box1-txt a {
        display: inline-block;
        font-size: 20px;
        text-align: center;
        border-radius: .5em;
        width: 110px; /* 宽度 */
        border-width: 0px; /* 边框宽度 */
        background: #ffb1b1; /* 背景颜色 */
        cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
        outline: none; /* 不显示轮廓线 */
        font-family: Microsoft YaHei; /* 设置字体 */
        color: white; /* 字体颜色 */
    }

    .box1-txt a:hover {
        background: #E6E6E6;
        color: #A4A4A4;
    }

    .box1-txt {
        margin-bottom: 10px;
        padding-bottom: 5px;
        line-height: 30px;
        font-size: 20px;
        border-bottom: solid 1px #000;
    }

    .info-list li {
        height: 33px;
        line-height: 33px;
        font-size: 17px;
        border-bottom: 1px solid #eee;
    }

    .info-list span {
        float: left;
        width: 340px;
        font-size: 14px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    #myPost-list li a:hover {
        font-weight: bold;
        color: black;
    }

    #myCollect-list li a:hover {
        font-weight: bold;
        color: black;
    }
</style>
<body>
<form id="formUserInfo" autocomplete="off" action="" method="post">
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
            <section>
                <div class="box1">
                    <h2 class="box1-txt"><span>个人信息</span>
                        <a style="margin-left: 60%; margin-right: 20px;" onclick="editInfo()">编辑资料</a>
                        <a onclick="submitInfo()">提交</a>
                    </h2>
                    <ul class="info-list" id="info-list">
                        <%--js--%>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>消息</span></h2>
                    <ul class="info-list" id="msg-list">
                        <li><a><span>xxxxx</span></a></li>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>我的发布</span></h2>
                    <ul class="info-list" id="myPost-list">
                        <%--js--%>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>我的收藏</span></h2>
                    <ul class="info-list" id="myCollect-list">
                        <%--js--%>
                    </ul>
                </div>
            </section>


            <div class="shell-main-footer">
                <span>我是底边栏</span>
            </div>
        </div>

    </div>
</form>
</body>
<script>
    <%
    //获取当前URL，即访问登陆页面前的URL
    String preUrl = request.getRequestURL().toString();
    session.setAttribute("preUrl",preUrl);
    %>

    var username = "<%=session.getAttribute("username")%>";
    var upassword, uintroduce, avatar, email, birthday, access;

    if (username === "null") {
        document.getElementById("login").innerHTML = "登录/注册";
    } else {
        document.getElementById("login").innerHTML = "欢迎，" + username;
        document.getElementById("login").href = "./userInfo.jsp";
    }

    var myTitle1, myTitle2, myTitle3, myTitle4, myTitle5, myTitle6, myTitle7;
    var myContent1, myContent2, myContent3, myContent4, myContent5, myContent6, myContent7;
    var myDate1, myDate2, myDate3, myDate4, myDate5, myDate6, myDate7;
    var myArticleView1, myArticleView2, myArticleView3, myArticleView4, myArticleView5, myArticleView6, myArticleView7;
    var myArticleLike1, myArticleLike2, myArticleLike3, myArticleLike4, myArticleLike5, myArticleLike6, myArticleLike7;
    var myArticleCollect1, myArticleCollect2, myArticleCollect3, myArticleCollect4, myArticleCollect5,
        myArticleCollect6, myArticleCollect7;

    var myArticleTitle = [];
    var myArticleContent = [];
    var myArticleDate = [];
    var myArticleView = [];
    var myArticleLike = [];
    var myArticleCollect = [];

    myTitle1 = "<%=request.getAttribute("myTitle1")%>";
    myTitle2 = "<%=request.getAttribute("myTitle2")%>";
    myTitle3 = "<%=request.getAttribute("myTitle3")%>";
    myTitle4 = "<%=request.getAttribute("myTitle4")%>";
    myTitle5 = "<%=request.getAttribute("myTitle5")%>";
    myTitle6 = "<%=request.getAttribute("myTitle6")%>";

    /*TODO: request无法读取有换行的数据*/
    myContent1 = "<%=request.getAttribute("myContent1")%>";
    myContent2 = "<%=request.getAttribute("myContent2")%>";
    myContent3 = "<%=request.getAttribute("myContent3")%>";
    myContent4 = "<%=request.getAttribute("myContent4")%>";
    myContent5 = "<%=request.getAttribute("myContent5")%>";
    myContent6 = "<%=request.getAttribute("myContent6")%>";

    myDate1 = "<%=request.getAttribute("myDate1")%>";
    myDate2 = "<%=request.getAttribute("myDate2")%>";
    myDate3 = "<%=request.getAttribute("myDate3")%>";
    myDate4 = "<%=request.getAttribute("myDate4")%>";
    myDate5 = "<%=request.getAttribute("myDate5")%>";
    myDate6 = "<%=request.getAttribute("myDate6")%>";

    myView1 = "<%=request.getAttribute("myView1")%>";
    myView2 = "<%=request.getAttribute("myView2")%>";
    myView3 = "<%=request.getAttribute("myView3")%>";
    myView4 = "<%=request.getAttribute("myView4")%>";
    myView5 = "<%=request.getAttribute("myView5")%>";
    myView6 = "<%=request.getAttribute("myView6")%>";

    myLike1 = "<%=request.getAttribute("myLike1")%>";
    myLike2 = "<%=request.getAttribute("myLike2")%>";
    myLike3 = "<%=request.getAttribute("myLike3")%>";
    myLike4 = "<%=request.getAttribute("myLike4")%>";
    myLike5 = "<%=request.getAttribute("myLike5")%>";
    myLike6 = "<%=request.getAttribute("myLike6")%>";

    myCollect1 = "<%=request.getAttribute("myCollect1")%>";
    myCollect2 = "<%=request.getAttribute("myCollect2")%>";
    myCollect3 = "<%=request.getAttribute("myCollect3")%>";
    myCollect4 = "<%=request.getAttribute("myCollect4")%>";
    myCollect5 = "<%=request.getAttribute("myCollect5")%>";
    myCollect6 = "<%=request.getAttribute("myCollect6")%>";

    upassword = "<%=request.getAttribute("upassword")%>";
    uintroduce = "<%=request.getAttribute("uintroduce")%>";
    avatar = "<%=request.getAttribute("avatar")%>";
    email = "<%=request.getAttribute("email")%>";
    birthday = "<%=request.getAttribute("birthday")%>";
    access = "<%=request.getAttribute("access")%>";

    if (access === '0') {
        access = "普通用户";
    } else if (access === '1') {
        access = "管理员";
    }

    window.onload = function () {
        /*TODO: 添加修改个人信息功能*/
        /*个人信息栏*/
        var html = "<li><a><span>头像</span><span>" + avatar + "</span></a></li>" +
            "<li><a><span>用户名</span><span>" + username + "</span></a></li>" +
            "<li><a><span>密码</span><span>" + upassword + "</span></a></li>" +
            "<li><a><span>简介</span><span>" + uintroduce + "</span></a></li>" +
            "<li><a><span>邮箱</span><span>" + email + "</span></a></li>" +
            "<li><a><span>生日</span><span>" + birthday + "</span></a></li>" +
            "<li><a><span>管理员权限</span><span>" + access + "</span></a></li>";
        document.getElementById("info-list").innerHTML = html;

        /*我的发布栏*/
        html = '<li><a href="article.jsp?Article=' + myTitle1 + '"><span>' + myTitle1 + '</span><span>阅读：' + myView1 + '获赞：' + myLike1 + '收藏：' + myCollect1 + '日期：' + myDate1 + '</span></a></li>' +
            '<li><a href="article.jsp?Article=' + myTitle2 + '"><span>' + myTitle2 + '</span><span>阅读：' + myView2 + '获赞：' + myLike2 + '收藏：' + myCollect2 + '日期：' + myDate2 + '</span></a></li>' +
            '<li><a href="article.jsp?Article=' + myTitle3 + '"><span>' + myTitle3 + '</span><span>阅读：' + myView3 + '获赞：' + myLike3 + '收藏：' + myCollect3 + '日期：' + myDate3 + '</span></a></li>' +
            '<li><a href="article.jsp?Article=' + myTitle4 + '"><span>' + myTitle4 + '</span><span>阅读：' + myView4 + '获赞：' + myLike4 + '收藏：' + myCollect4 + '日期：' + myDate4 + '</span></a></li>' +
            '<li><a href="article.jsp?Article=' + myTitle5 + '"><span>' + myTitle5 + '</span><span>阅读：' + myView5 + '获赞：' + myLike5 + '收藏：' + myCollect5 + '日期：' + myDate5 + '</span></a></li>' +
            '<li><a href="article.jsp?Article=' + myTitle6 + '"><span>' + myTitle6 + '</span><span>阅读：' + myView6 + '获赞：' + myLike6 + '收藏：' + myCollect6 + '日期：' + myDate6 + '</span></a></li>';
        document.getElementById("myPost-list").innerHTML = html;

        /*我的收藏栏*/
        // html = '<li><a href="article.jsp?Article=' + myTitle1 + '"><span>' + myTitle1 + '</span></a></li>' +
        //     '<li><a href="article.jsp?Article=' + myTitle2 + '"><span>' + myTitle2 + '</span></a></li>' +
        //     '<li><a href="article.jsp?Article=' + myTitle3 + '"><span>' + myTitle3 + '</span></a></li>' +
        //     '<li><a href="article.jsp?Article=' + myTitle4 + '"><span>' + myTitle4 + '</span></a></li>' +
        //     '<li><a href="article.jsp?Article=' + myTitle5 + '"><span>' + myTitle5 + '</span></a></li>' +
        //     '<li><a href="article.jsp?Article=' + myTitle6 + '"><span>' + myTitle6 + '</span></a></li>';
        // document.getElementById("myCollect-list").innerHTML = html;
    }

    function editInfo() {
        var html = "<li><a><span>头像</span><input id='newAvatar' name='newAvatar' type='text' autocomplete='off' placeholder='" + avatar + "'></a></li>" +
            "<li><a><span>用户名</span><input id='newUsername' name='newUsername' type='text' autocomplete='off' placeholder='" + username + "'></a></li>" +
            "<li><a><span>密码</span><input id='newUpassword' name='newUpassword' type='text' autocomplete='off' placeholder='" + upassword + "'></a></li>" +
            "<li><a><span>简介</span><input id='newUintroduce' name='newUintroduce' type='text' autocomplete='off' placeholder='" + uintroduce + "'></a></li>" +
            "<li><a><span>邮箱</span><input id='newEmail' name='newEmail' type='text' autocomplete='off' placeholder='" + email + "'></a></li>" +
            "<li><a><span>生日</span><input id='newBirthday' name='newBirthday' type='text' autocomplete='off' placeholder='" + birthday + "'></a></li>" +
            "<li><a><span>管理员权限</span><span>" + access + "</span></a></li>";
        document.getElementById("info-list").innerHTML = html;
    }

    function submitInfo() {
        document.getElementById("formUserInfo").action = "/updateUserInfo";
        document.getElementById("formUserInfo").submit();
    }

</script>
</html>
