<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-18
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
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
<script>
    let msg = "${msg}";
    if(msg !== "")
        alert(msg)
</script>
<form id="formUserInfo" autocomplete="off" action="" method="post">
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
            <section>
                <div class="box1">
                    <h2 class="box1-txt"><span>个人信息</span>
                        <a style="margin-left: 60%; margin-right: 20px;" href="javascript:;" onclick="editUserInfo()">编辑资料</a>
                        <a onclick="submitInfo()">提交</a>
                    </h2>
                    <ul class="info-list" id="info-list" style="display: block">
                        <li><a><span>头像</span><span>${self.avatar}</span></a></li>
                        <li><a><span>用户名</span><span>${self.uname}</span></a></li>
                        <li><a><span>密码</span><span>${self.upassword}</span></a></li>
                        <li><a><span>简介</span><span>${self.uintroduce}</span></a></li>
                        <li><a><span>邮箱</span><span>${self.email}</span></a></li>
                        <li><a><span>生日</span><span>${self.birthday}</span></a></li>
                        <li><a><span>管理员权限</span><span><c:if test="${self.access == 0}">普通用户</c:if><c:if test="${self.access == 1}">管理员</c:if></span></a></li>
                    </ul>
                    <ul class="info-list" id="info-list-edit" style="display: none">
                        <li><a><span>头像</span><input id='newAvatar' name='newAvatar' type='text' autocomplete='off' placeholder=${self.avatar}></a></li>
                        <li><a><span>用户名</span><input id='newUsername' name='newUsername' type='text' autocomplete='off' placeholder=${self.uname}></a></li>
                        <li><a><span>密码</span><input id='newUpassword' name='newUpassword' type='text' autocomplete='off' placeholder=${self.upassword}></a></li>
                        <li><a><span>简介</span><input id='newUintroduce' name='newUintroduce' type='text' autocomplete='off' placeholder=${self.uintroduce}></a></li>
                        <li><a><span>邮箱</span><input id='newEmail' name='newEmail' type='text' autocomplete='off' placeholder=${self.email}></a></li>
                        <li><a><span>生日</span><input id='newBirthday' name='newBirthday' type='text' autocomplete='off' placeholder=${self.birthday}></a></li>
                        <li><a><span>管理员权限</span><span><c:if test="${self.access == 0}">普通用户</c:if><c:if test="${self.access == 1}">管理员</c:if></span></a></li>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>消息</span></h2>
                    <ul class="info-list" id="msg-list">
                        <li><a><span>这里空空如也~</span></a></li>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>我的发布</span></h2>
                    <ul class="info-list" id="myPost-list">
                        <c:if test="${myArticles.size() == 0}">
                            <li><a><span>这里空空如也~</span></a></li>
                        </c:if>
                        <c:forEach items="${myArticles}" var="myArticle">
                            <li><a href="/reloadArticle?Article=${article.title}"><span>${myArticle.title}</span>
                                <span>阅读: ${myArticle.view}&nbsp&nbsp获赞: ${myArticle.like}&nbsp&nbsp收藏: ${myArticle.collect}&nbsp&nbsp日期: ${myArticle.date}</span></a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="box1">
                    <h2 class="box1-txt"><span>我的收藏</span></h2>
                    <ul class="info-list" id="myCollect-list">
                        <li><a><span>这里空空如也~</span></a></li>
                    </ul>
                </div>
            </section>


            <div class="shell-main-footer">
                <span>旌旗在望，鼓角相闻</span>
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
            window.location.href = "/reloadUserInfo?user=" + username;
        }
    }

    function editUserInfo() {
        document.getElementById("info-list").style.display = "none";
        document.getElementById("info-list-edit").style.display = "block";
    }

    function submitInfo() {
        document.getElementById("formUserInfo").action = "/updateUserInfo";
        document.getElementById("formUserInfo").submit();
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
