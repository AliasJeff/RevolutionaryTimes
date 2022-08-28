<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-27
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>上传图片</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
</head>
<style>
    #image-preview {
        border: 1px solid #ccc;
        width: 100%;
        height: 100%;
        max-width: 200px;
        max-height: 200px;
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center center;
    }
</style>
<body>
<script>
    let msg = "${msg}";
    if(msg !== "")
        alert(msg)
</script>
<form id="postPictureForm" action="/uploadPicture" method="post" enctype="multipart/form-data">
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
            <p>图片预览：</p>
            <img id="image-preview">
            <p>
                <input type="file" name="file" id="file"/>
                <input type="submit"/>
            </p>
            <p id="info"></p>
            <input type="hidden" id="date1" name="date1">
        </div>
    </div>
</form>
</body>
<script>
    <%
    //获取当前请求的上一个URL，即访问登陆页面前的URL
    String preUrl = request.getRequestURL().toString();
    session.setAttribute("preUrl",preUrl);
    %>

    var form = document.getElementById("postPictureForm")
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
    document.getElementById("date1").innerHTML = dateTime;
    document.getElementById("date1").value = dateTime;


    let fileInput = document.getElementById('file');
    let info = document.getElementById('info');
    let preview = document.getElementById('image-preview');
    // 监听change事件:
    fileInput.addEventListener('change', function () {
        // 清除背景图片:
        preview.style.backgroundImage = '';
        if (!fileInput.value) {
            info.innerHTML = '没有选择文件';
            return;
        }
        // 读取文件:
        let reader = new FileReader();
        reader.onload = function (e) {
            let data = e.target.result;
            console.log(preview, 'a标签')
            preview.src = data
        };
        // 以DataURL的形式读取文件:
        reader.readAsDataURL(file);
    });
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
