<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-8
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>旌旗在望-后台管理</title>
    <link rel="stylesheet" href="./layui/layui/css/layui.css">
</head>
<style>
    .table {
        text-align: center;
        margin-top: 13px;
    }
    .table td{
        background-color: #ffffff;
    }
    .layui-body a {
        display: inline-block;
        font-size: 20px;
        text-align: center;
        border-radius: .5em;
        width: 110px; /* 宽度 */
        border-width: 0px; /* 边框宽度 */
        background: #8e9aaf; /* 背景颜色 */
        cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
        outline: none; /* 不显示轮廓线 */
        font-family: Microsoft YaHei; /* 设置字体 */
        color: white; /* 字体颜色 */
    }

    .layui-body a:hover {
        background: #E6E6E6;
        color: #A4A4A4;
    }
</style>
<body>
<%--TODO: 后台管理页--%>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo layui-hide-xs layui-bg-black">后台管理</div>
            <!-- 头部区域（可配合layui 已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <!-- 移动端显示 -->
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                    <i class="layui-icon layui-icon-spread-left"></i>
                </li>

                <li class="layui-nav-item layui-hide-xs"><a href="index.jsp">返回主页</a></li>
                <li class="layui-nav-item layui-hide-xs"><a href="javascript:;">xxx</a></li>
                <li class="layui-nav-item layui-hide-xs"><a href="javascript:;">xxx</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">nav groups</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">menu 11</a></dd>
                        <dd><a href="">menu 22</a></dd>
                        <dd><a href="">menu 33</a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                    <a id="myProfile" href="javascript:;">
                        <%--js--%>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="">Your Profile</a></dd>
                        <dd><a href="">Settings</a></dd>
                        <dd><a href="">Sign out</a></dd>
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
                            <dd><a href="javascript:;" onclick="resourceManage()">资源管理</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="javascript:;">click menu item</a></li>
                    <li class="layui-nav-item"><a href="">the links</a></li>
                </ul>
            </div>
        </div>

        <div class="layui-body">
            <!-- 内容主体区域 -->
            <div id="main" style="padding: 15px;">
                <%--js--%>
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            底部固定区域
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
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });

    var admin = "<%=session.getAttribute("username")%>";
    var html = "<img src='./image/image/logo.jpg' class='layui-nav-img'>" + admin
    document.getElementById("myProfile").innerHTML = html;

</script>
<script>
    var bsAvatar = [], bsUserName = [], bsUserPassword = [], bsUserIntroduce = [], bsUserEmail = [], bsUserBirthday = [], bsUserAccess = [];
    var bsAvatar1, bsAvatar2, bsAvatar3, bsAvatar4, bsAvatar5;
    var bsUserName1, bsUserName2, bsUserName3, bsUserName4, bsUserName5;
    var bsUserPassword1, bsUserPassword2, bsUserPassword3, bsUserPassword4, bsUserPassword5;
    var bsUserIntroduce1, bsUserIntroduce2, bsUserIntroduce3, bsUserIntroduce4, bsUserIntroduce5;
    var bsUserEmail1, bsUserEmail2, bsUserEmail3, bsUserEmail4, bsUserEmail5;
    var bsUserBirthday1, bsUserBirthday2, bsUserBirthday3, bsUserBirthday4, bsUserBirthday5;
    var bsUserAccess1, bsUserAccess2, bsUserAccess3, bsUserAccess4, bsUserAccess5;

    var bsAuthor = [], bsArticleView = [], bsArticleLike = [], bsArticleCollect = [], bsArticleTitle = [], bsArticleContent = [], bsArticleDate = [];
    var bsAuthor1,bsAuthor2,bsAuthor3,bsAuthor4,bsAuthor5;
    var bsArticleView1,bsArticleView2,bsArticleView3,bsArticleView4,bsArticleView5;
    var bsArticleLike1,bsArticleLike2,bsArticleLike3,bsArticleLike4,bsArticleLike5;
    var bsArticleCollect1,bsArticleCollect2,bsArticleCollect3,bsArticleCollect4,bsArticleCollect5;
    var bsArticleTitle1,bsArticleTitle2,bsArticleTitle3,bsArticleTitle4,bsArticleTitle5;
    var bsArticleContent1,bsArticleContent2,bsArticleContent3,bsArticleContent4,bsArticleContent5;
    var bsArticleDate1,bsArticleDate2,bsArticleDate3,bsArticleDate4,bsArticleDate5;

    bsAvatar1 = "<%=request.getAttribute("bsAvatar1")%>";
    bsAvatar2 = "<%=request.getAttribute("bsAvatar2")%>";
    bsAvatar3 = "<%=request.getAttribute("bsAvatar3")%>";
    bsAvatar4 = "<%=request.getAttribute("bsAvatar4")%>";
    bsAvatar5 = "<%=request.getAttribute("bsAvatar5")%>";
    bsUserName1 = "<%=request.getAttribute("bsUserName1")%>";
    bsUserName2 = "<%=request.getAttribute("bsUserName2")%>";
    bsUserName3 = "<%=request.getAttribute("bsUserName3")%>";
    bsUserName4 = "<%=request.getAttribute("bsUserName4")%>";
    bsUserName5 = "<%=request.getAttribute("bsUserName5")%>";
    bsUserPassword1 = "<%=request.getAttribute("bsUserPassword1")%>";
    bsUserPassword2 = "<%=request.getAttribute("bsUserPassword2")%>";
    bsUserPassword3 = "<%=request.getAttribute("bsUserPassword3")%>";
    bsUserPassword4 = "<%=request.getAttribute("bsUserPassword4")%>";
    bsUserPassword5 = "<%=request.getAttribute("bsUserPassword5")%>";
    bsUserIntroduce1 = "<%=request.getAttribute("bsUserIntroduce1")%>";
    bsUserIntroduce2 = "<%=request.getAttribute("bsUserIntroduce2")%>";
    bsUserIntroduce3 = "<%=request.getAttribute("bsUserIntroduce3")%>";
    bsUserIntroduce4 = "<%=request.getAttribute("bsUserIntroduce4")%>";
    bsUserIntroduce5 = "<%=request.getAttribute("bsUserIntroduce5")%>";
    bsUserEmail1 = "<%=request.getAttribute("bsUserEmail1")%>";
    bsUserEmail2 = "<%=request.getAttribute("bsUserEmail2")%>";
    bsUserEmail3 = "<%=request.getAttribute("bsUserEmail3")%>";
    bsUserEmail4 = "<%=request.getAttribute("bsUserEmail4")%>";
    bsUserEmail5 = "<%=request.getAttribute("bsUserEmail5")%>";
    bsUserBirthday1 = "<%=request.getAttribute("bsUserBirthday1")%>";
    bsUserBirthday2 = "<%=request.getAttribute("bsUserBirthday2")%>";
    bsUserBirthday3 = "<%=request.getAttribute("bsUserBirthday3")%>";
    bsUserBirthday4 = "<%=request.getAttribute("bsUserBirthday4")%>";
    bsUserBirthday5 = "<%=request.getAttribute("bsUserBirthday5")%>";
    bsUserAccess1 = "<%=request.getAttribute("bsUserAccess1")%>";
    bsUserAccess2 = "<%=request.getAttribute("bsUserAccess2")%>";
    bsUserAccess3 = "<%=request.getAttribute("bsUserAccess3")%>";
    bsUserAccess4 = "<%=request.getAttribute("bsUserAccess4")%>";
    bsUserAccess5 = "<%=request.getAttribute("bsUserAccess5")%>";

    bsAuthor1 = "<%=request.getAttribute("bsAuthor1")%>";
    bsAuthor2 = "<%=request.getAttribute("bsAuthor2")%>";
    bsAuthor3 = "<%=request.getAttribute("bsAuthor3")%>";
    bsAuthor4 = "<%=request.getAttribute("bsAuthor4")%>";
    bsAuthor5 = "<%=request.getAttribute("bsAuthor5")%>";
    bsArticleTitle1 = "<%=request.getAttribute("bsArticleTitle1")%>";
    bsArticleTitle2 = "<%=request.getAttribute("bsArticleTitle2")%>";
    bsArticleTitle3 = "<%=request.getAttribute("bsArticleTitle3")%>";
    bsArticleTitle4 = "<%=request.getAttribute("bsArticleTitle4")%>";
    bsArticleTitle5 = "<%=request.getAttribute("bsArticleTitle5")%>";
    bsArticleContent1 = "<%=request.getAttribute("bsArticleContent1")%>";
    bsArticleContent2 = "<%=request.getAttribute("bsArticleContent2")%>";
    bsArticleContent3 = "<%=request.getAttribute("bsArticleContent3")%>";
    bsArticleContent4 = "<%=request.getAttribute("bsArticleContent4")%>";
    bsArticleContent5 = "<%=request.getAttribute("bsArticleContent5")%>";
    bsArticleView1 = "<%=request.getAttribute("bsArticleView1")%>";
    bsArticleView2 = "<%=request.getAttribute("bsArticleView2")%>";
    bsArticleView3 = "<%=request.getAttribute("bsArticleView3")%>";
    bsArticleView4 = "<%=request.getAttribute("bsArticleView4")%>";
    bsArticleView5 = "<%=request.getAttribute("bsArticleView5")%>";
    bsArticleLike1 = "<%=request.getAttribute("bsArticleLike1")%>";
    bsArticleLike2 = "<%=request.getAttribute("bsArticleLike2")%>";
    bsArticleLike3 = "<%=request.getAttribute("bsArticleLike3")%>";
    bsArticleLike4 = "<%=request.getAttribute("bsArticleLike4")%>";
    bsArticleLike5 = "<%=request.getAttribute("bsArticleLike5")%>";
    bsArticleCollect1 = "<%=request.getAttribute("bsArticleCollect1")%>";
    bsArticleCollect2 = "<%=request.getAttribute("bsArticleCollect2")%>";
    bsArticleCollect3 = "<%=request.getAttribute("bsArticleCollect3")%>";
    bsArticleCollect4 = "<%=request.getAttribute("bsArticleCollect4")%>";
    bsArticleCollect5 = "<%=request.getAttribute("bsArticleCollect5")%>";
    bsArticleDate1 = "<%=request.getAttribute("bsArticleDate1")%>";
    bsArticleDate2 = "<%=request.getAttribute("bsArticleDate2")%>";
    bsArticleDate3 = "<%=request.getAttribute("bsArticleDate3")%>";
    bsArticleDate4 = "<%=request.getAttribute("bsArticleDate4")%>";
    bsArticleDate5 = "<%=request.getAttribute("bsArticleDate5")%>";


    var main = document.getElementById("main");

    function userInfo() {
        // "<td>" + "<input id='newAvatar' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsAvatar1 + "'>" + "</td>" +
        // "<td>" + "<input id='newUsername' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserName1 + "'>" + "</td>" +
        // "<td>" + "<input id='newUpassword' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserPassword1 + "'>" + "</td>" +
        // "<td>" + "<input id='newUintroduce' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserIntroduce1 + "'>" + "</td>" +
        // "<td>" + "<input id='newEmail' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserEmail1 + "'>" + "</td>" +
        // "<td>" + "<input id='newBirthday' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserBirthday1 + "'>" + "</td>" +
        // "<td>" + "<input id='newAccess' name='newAvatar' type='text' autocomplete='off' placeholder='" + bsUserAccess1 + "'>" + "</td>" +
        html = "<table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center' bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>" +
            "<tr>" +
            "<td>头像</td>" +
            "<td>用户名</td>" +
            "<td>密码</td>" +
            "<td>简介</td>" +
            "<td>邮箱</td>" +
            "<td>生日</td>" +
            "<td>权限</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAvatar1 + "</td>" +
            "<td>" + bsUserName1 + "</td>" +
            "<td>" + bsUserPassword1 + "</td>" +
            "<td>" + bsUserIntroduce1 + "</td>" +
            "<td>" + bsUserEmail1 + "</td>" +
            "<td>" + bsUserBirthday1 + "</td>" +
            "<td>" + bsUserAccess1 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAvatar2 + "</td>" +
            "<td>" + bsUserName2 + "</td>" +
            "<td>" + bsUserPassword2 + "</td>" +
            "<td>" + bsUserIntroduce2 + "</td>" +
            "<td>" + bsUserEmail2 + "</td>" +
            "<td>" + bsUserBirthday2 + "</td>" +
            "<td>" + bsUserAccess2 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAvatar3 + "</td>" +
            "<td>" + bsUserName3 + "</td>" +
            "<td>" + bsUserPassword3 + "</td>" +
            "<td>" + bsUserIntroduce3 + "</td>" +
            "<td>" + bsUserEmail3 + "</td>" +
            "<td>" + bsUserBirthday3 + "</td>" +
            "<td>" + bsUserAccess3 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAvatar4 + "</td>" +
            "<td>" + bsUserName4 + "</td>" +
            "<td>" + bsUserPassword4 + "</td>" +
            "<td>" + bsUserIntroduce4 + "</td>" +
            "<td>" + bsUserEmail4 + "</td>" +
            "<td>" + bsUserBirthday4 + "</td>" +
            "<td>" + bsUserAccess4 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAvatar5 + "</td>" +
            "<td>" + bsUserName5 + "</td>" +
            "<td>" + bsUserPassword5 + "</td>" +
            "<td>" + bsUserIntroduce5 + "</td>" +
            "<td>" + bsUserEmail5 + "</td>" +
            "<td>" + bsUserBirthday5 + "</td>" +
            "<td>" + bsUserAccess5 + "</td>" +
            "</tr>" +
            "</table>" +
            "<a href='javascript:;' style='margin-left: 70%; margin-right: 20px;' onclick='bsEditUserInfo()'>编辑资料</a>" +
            "<a href='javascript:;' onclick='bsSubmitUserInfo()'>提交</a>";
        main.innerHTML = html;
    }

    function userComment() {
        html = ""
        main.innerHTML = html;
    }

    function articleManage() {
        html = "<table class='table' width='100%' border='0' cellspacing='1' cellpadding='4' align='center' bgcolor='#cccccc' style='text-align: center; margin-top: 13px;'>" +
            "<tr>" +
            "<td>作者</td>" +
            "<td>阅读</td>" +
            "<td>点赞</td>" +
            "<td>收藏</td>" +
            "<td>标题</td>" +
            "<td>内容</td>" +
            "<td>日期</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAuthor1 + "</td>" +
            "<td>" + bsArticleView1 + "</td>" +
            "<td>" + bsArticleLike1 + "</td>" +
            "<td>" + bsArticleCollect1 + "</td>" +
            "<td>" + bsArticleTitle1 + "</td>" +
            "<td>" + bsArticleContent1 + "</td>" +
            "<td>" + bsArticleDate1 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAuthor2 + "</td>" +
            "<td>" + bsArticleView2 + "</td>" +
            "<td>" + bsArticleLike2 + "</td>" +
            "<td>" + bsArticleCollect2 + "</td>" +
            "<td>" + bsArticleTitle2 + "</td>" +
            "<td>" + bsArticleContent2 + "</td>" +
            "<td>" + bsArticleDate2 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAuthor3 + "</td>" +
            "<td>" + bsArticleView3 + "</td>" +
            "<td>" + bsArticleLike3 + "</td>" +
            "<td>" + bsArticleCollect3 + "</td>" +
            "<td>" + bsArticleTitle3 + "</td>" +
            "<td>" + bsArticleContent3 + "</td>" +
            "<td>" + bsArticleDate3 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAuthor4 + "</td>" +
            "<td>" + bsArticleView4 + "</td>" +
            "<td>" + bsArticleLike4 + "</td>" +
            "<td>" + bsArticleCollect4 + "</td>" +
            "<td>" + bsArticleTitle4 + "</td>" +
            "<td>" + bsArticleContent4 + "</td>" +
            "<td>" + bsArticleDate4 + "</td>" +
            "</tr>" +
            "<tr>" +
            "<td>" + bsAuthor5 + "</td>" +
            "<td>" + bsArticleView5 + "</td>" +
            "<td>" + bsArticleLike5 + "</td>" +
            "<td>" + bsArticleCollect5 + "</td>" +
            "<td>" + bsArticleTitle5 + "</td>" +
            "<td>" + bsArticleContent5 + "</td>" +
            "<td>" + bsArticleDate5 + "</td>" +
            "</tr>" +
            "</table>" +
            "<a href='javascript:;' style='margin-left: 70%; margin-right: 20px;' onclick='bsEditArticleInfo()'>编辑资料</a>" +
            "<a href='javascript:;' onclick='bsSubmitArticleInfo()'>提交</a>";
        main.innerHTML = html;
    }

    function courseManage() {
        html = ""
        main.innerHTML = html;
    }

    function resourceManage() {
        html = ""
        main.innerHTML = html;
    }

    function bsSubmitUserInfo() {

    }

    function bsSubmitArticleInfo() {

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