<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-8
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>旌旗在望-后台管理</title>
    <link rel="stylesheet" href="./layui/layui/css/layui1.css">
</head>
<style>
    table {
        width: 90%;
        border: 1px solid black;
        margin: 0 auto;
        border-collapse: collapse;
    }

    td {
        height: 50px;
        border: 1px solid black;
        text-align: center;
        vertical-align: center;
    }

    tbody tr:nth-child(even) {
        background-color: antiquewhite;
    }

    .bsButton {
        display: inline-block;
        right: 5%;
        min-width: 88px;
        width: 90px;
        height: 32px;
        line-height: 32px;
        text-align: center;
        color: #fff;
        background-color: #fc5531;
        border-radius: 20px;
        margin-top: calc((48px - 32px) / 2);
    }

    .bsButton:hover {
        background: #E6E6E6;
        color: #A4A4A4;
    }

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
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">旌旗在望·后台管理</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="index.jsp">返回主页</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a id="myProfile" href="javascript:;">
                    <%--js--%>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/reloadUserInfo">个人中心</a></dd>
                    <dd><a href="./logout.jsp">退出登录</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="userInfo()">用户信息</a></dd>
                        <dd><a href="javascript:;" onclick="userComment()">用户评论</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">后台管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="articleManage()">文章管理</a></dd>
                        <dd><a href="javascript:;" onclick="courseManage()">课程管理</a></dd>
                        <dd><a href="javascript:;" onclick="pictureManage()">图片管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <%--用户信息--%>
        <div class="main" id="box1" style="display: none">
            <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                   bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                <tr>
                    <td>头像</td>
                    <td>用户名</td>
                    <td>密码</td>
                    <td>简介</td>
                    <td>邮箱</td>
                    <td>生日</td>
                    <td>权限</td>
                    <td>操作</td>
                </tr>
                <c:forEach items='${users}' var='user'>
                    <tr>
                        <td>${user.avatar}</td>
                        <td>${user.uname}</td>
                        <td>${user.upassword}</td>
                        <td>${user.uintroduce}</td>
                        <td>${user.email}</td>
                        <td>${user.birthday}</td>
                        <td>${user.access}</td>
                        <td><a href="/delete?uid=${user.uid}" style="text-decoration: underline;">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsEditUserInfo()'>编辑资料</a>
        </div>
        <div class="main" id="box1Edit" style="display: none">
            <form id="bsEditUserForm" autocomplete="off" action="" method="post">
                <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                       bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                    <tr>
                        <td>头像</td>
                        <td>用户名</td>
                        <td>密码</td>
                        <td>简介</td>
                        <td>邮箱</td>
                        <td>生日</td>
                        <td>权限</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items='${users}' var='user'>
                        <tr>
                            <td><input name="newAvatar" type='text' autocomplete='off'
                                                     placeholder=${user.avatar}></td>
                            <td><input name="newUname" type='text' autocomplete='off'
                                                    placeholder=${user.uname}></td>
                            <td><input name="newUpassword" type='text' autocomplete='off'
                                                        placeholder=${user.upassword}></td>
                            <td><input name="newUintroduce" type='text' autocomplete='off'
                                                         placeholder=${user.uintroduce}></td>
                            <td><input name="newEmail" type='text' autocomplete='off'
                                                    placeholder=${user.email}></td>
                            <td><input name="newBirthday" type='text' autocomplete='off'
                                                       placeholder=${user.birthday}></td>
                            <td><input name="newAccess" type='text' autocomplete='off'
                                                     placeholder=${user.access}></td>
                            <td><a href="/delete?uid=${user.uid}" style="text-decoration: underline;">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsSubmitUserInfo()'>提交修改</a>
            </form>
        </div>
        <%--用户评论--%>
        <div class="main" id="box2" style="display: none">
            <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                   bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                <tr>
                    <td>文章</td>
                    <td>用户名</td>
                    <td>评论用户</td>
                    <td>评论内容</td>
                    <td>日期</td>
                    <td>操作</td>
                </tr>
                <c:forEach items='${comments}' var='comment'>
                    <tr>
                        <td>${comment.articleTitle}</td>
                        <td>${comment.uname}</td>
                        <td>${comment.uoname}</td>
                        <td>${comment.commentContent}</td>
                        <td>${comment.date}</td>
                        <td><a href="/delete?commentid=${comment.commentid}" style="text-decoration: underline;">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsEditComment()'>编辑资料</a>
        </div>
        <div class="main" id="box2Edit" style="display: none">

        </div>
        <%--文章信息--%>
        <div class="main" id="box3" style="display: none">
            <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                   bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                <tr>
                    <td>作者</td>
                    <td>阅读</td>
                    <td>点赞</td>
                    <td>收藏</td>
                    <td>标题</td>
                    <td>内容</td>
                    <td>日期</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${articles}" var="article">
                    <tr>
                        <td>${article.uname}</td>
                        <td>${article.view}</td>
                        <td>${article.like}</td>
                        <td>${article.collect}</td>
                        <td>${article.title}</td>
                        <td>${article.content}</td>
                        <td>${article.date}</td>
                        <td><a href="/delete?articleid=${article.articleid}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsEditArticle()'>编辑资料</a>
        </div>
        <div class="main" id="box3Edit" style="display: none">

        </div>
        <%--课程--%>
        <div class="main" id="box4" style="display: none">
            <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                   bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                <tr>
                    <td>上传者</td>
                    <td>课程名称</td>
                    <td>课程预览</td>
                    <td>上传时间</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${courses}" var="course">
                    <tr>
                        <td>${course.uname}</td>
                        <td>${course.cname}</td>
                        <td><video src="<%=request.getRealPath("/courses") + "\\"%>${course.cname}"></video></td>
                        <td>${course.date}</td>
                        <td><a href="/delete?courseid=${course.courseid}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsEditCourse()'>编辑资料</a>
        </div>
        <div class="main" id="box4Edit" style="display: none">

        </div>
        <%--图片--%>
        <div class="main" id="box5" style="display: none">
            <table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center'
                   bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>
                <tr>
                    <td>上传者</td>
                    <td>图片名称</td>
                    <td>图片预览</td>
                    <td>上传时间</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pictures}" var="picture">
                    <tr>
                        <td>${picture.uname}</td>
                        <td>${picture.pname}</td>
                        <td><img src="<%=request.getRealPath("/images") + "\\"%>${picture.pname}" alt=""></td>
                        <td>${picture.date}</td>
                        <td><a href="/delete?pictureid=${picture.pictureid}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a class="bsButton" href='javascript:;' style='margin-left: 88%' onclick='bsEditPicture()'>编辑资料</a>
        </div>
        <div class="main" id="box5Edit" style="display: none">

        </div>
    </div>

</div>
<script src="./layui/layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;"></div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });

    let admin = "<%=session.getAttribute("username")%>";
    let html = "<img src='./image/flag.png' class='layui-nav-img'>" + admin
    document.getElementById("myProfile").innerHTML = html;

</script>
<script>
    function userInfo() {
        document.getElementById("box1").style.display = "block"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function bsEditUserInfo() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "block"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function userComment() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "block"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function bsEditComment() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "block"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function articleManage() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "block"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function bsEditArticle() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "block"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function courseManage() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "block"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function bsEditCourse() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "block"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "none"
    }

    function pictureManage() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "block"
        document.getElementById("box5Edit").style.display = "none"
    }

    function bsEditPicture() {
        document.getElementById("box1").style.display = "none"
        document.getElementById("box1Edit").style.display = "none"
        document.getElementById("box2").style.display = "none"
        document.getElementById("box2Edit").style.display = "none"
        document.getElementById("box3").style.display = "none"
        document.getElementById("box3Edit").style.display = "none"
        document.getElementById("box4").style.display = "none"
        document.getElementById("box4Edit").style.display = "none"
        document.getElementById("box5").style.display = "none"
        document.getElementById("box5Edit").style.display = "block"
    }

    function bsSubmitUserInfo(username) {
        alert("功能正在开发中……")
    }

    function bsSubmitArticleInfo() {
        alert("功能正在开发中……")
    }

    function bsSubmitCommentInfo() {
        alert("功能正在开发中……")
    }

    function bsSubmitCourseInfo() {
        alert("功能正在开发中……")
    }

    function bsSubmitPictureInfo() {
        alert("功能正在开发中……")
    }
</script>
<style>
    .table {
        text-align: center;
        margin-top: 13px;
    }

    .table td {
        background-color: #ffffff;
    }
</style>
</body>
</html>