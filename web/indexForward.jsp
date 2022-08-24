<%@ page import="com.zhexun.entity.UserLogin" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhexun.entity.Article" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>旌旗在望</title>
    <link rel="stylesheet" href="./css/all.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/common.css">
    <script src="./js/swiper.js"></script>
</head>
<body>
<%--TODO: 添加搜索栏--%>
<form id="formIndex" autocomplete="off" action="" method="post">
    <div class="shell">
        <div class="shell-top">
            <div class="word">
                <h2 style="padding-right:130px">旌旗在望</h2>
                <h2 style="padding-left:130px">鼓角相闻</h2>
            </div>

            <video src="./image/V07512.mp4" loop autoplay muted></video>
        </div>

        <div class="shell-main">
            <%--顶部导航栏--%>
            <div class="shell-main-nav" style="margin-bottom: 120px">
                <div class="logo">
                    <img src="./image/image/logo.jpg" alt="">
                    <span>旌旗在望</span>
                </div>
                <ul>
                    <li><a href="./index.jsp">首页</a></li>
                    <li><a href="javascript:;" onclick="toUserInfo()">个人中心</a></li>
                    <%--TODO: 支持查看所有视频、图片、文章--%>
                    <li><a href="./allArticle.jsp">全部文章</a></li>
                    <%--TODO: 支持发布视频、图片、文章--%>
                    <li><a href="./postArticle.jsp">发布文章</a></li>
                    <%--TODO: 宽度不够--%>
                    <li><a id="login" href="./login.jsp"> <%--js--%> </a></li>
                    <div class="nav-box"></div>
                </ul>
            </div>
            <section>
                <div class="banner-box clearfix">
                    <div class="banner r">
                        <div>
                            <a class="a-img-ban img-ban-curr">
                                <video class="img-ban" src="./image/1.mp4" loop autoplay muted>浏览器不支持</video>
                            </a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/2.jpg"></a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/3.jpg"></a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/4.jpg"></a>
                        </div>
                        <ul class="r">
                            <li class="li-img curr"><img src="./image/1.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/2.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/3.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/4.jpg">
                                <div class="mask"></div>
                            </li>
                        </ul>
                    </div>
                    <div class="art l">
                        <h2 class="art-txt"><span>推荐文章</span></h2>
                        <ul class="art-list" id="art-list">
                            <c:forEach items="${articles}" var="article">
                                <li><a href="article.jsp?Article=${article.title}"><span>${article.title}</span></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <article>
                    <aside class="left-box l">
                        <div class="art Label clearfix">
                            <h2 class="art-txt"><span>热门标签</span></h2>
                            <div>
                                <a class="btn label" href="javascript:;">标签1</a>
                                <a class="btn label" href="javascript:;">标签2</a>
                                <a class="btn label" href="javascript:;">标签3</a>
                                <a class="btn label" href="javascript:;">标签4</a>
                                <a class="btn label" href="javascript:;">标签5</a>
                                <a class="btn label" href="javascript:;">标签6</a>
                                <a class="btn label" href="javascript:;">标签7</a>
                                <a class="btn label" href="javascript:;">标签8</a>
                            </div>
                        </div>
                        <div class="art Link mt20 clearfix">
                            <h2 class="art-txt"><span>个人信息</span></h2>
                            <ul class="art-list">
                                <li><a href="javascript:;" onclick="toUserInfo()"><span>个人中心</span></a></li>
                                <li><a href="javascript:;"><span>我的收藏</span></a></li>
                                <li><a href="javascript:;"><span>我的发布</span></a></li>
                                <li><a href="javascript:;"><span>消息中心</span></a></li>
                                <li><a href="javascript:;" onclick="toAdmin()"><span>管理员界面</span></a></li>
                                <li><a href="logout.jsp"><span>退出登录</span></a></li>
                            </ul>

                        </div>
                    </aside>
                    <div class="art-right r" id="art-right r">
                        <h2 class="art-txt"><span>最新文章</span></h2>
                        <%--TODO: 展示获赞、阅读、收藏数--%>
                        <%--TODO: content中request无法读取换行的数据--%>
                        <c:forEach items="${articles}" var="article">
                            <div class="art-model">
                                <h3><a href="article.jsp?Article=${article.title}">${article.title}</a></h3>
                                <p class="dateview"><span>发布时间: ${article.date}</span>
                                    <span>作者: ${article.uname}</span>
                                </p>
                                <dl class="img-txt">
                                    <dt>
                                        <img src="img/7.jpg" alt=${article.title} title=${article.title}>
                                    </dt>
                                    <dd>
                                        <p class="detail">${article.content}</p>
                                        <a href="article.jsp?Article=${article.title}" class="btn  c-fff">查看全文</a>
                                    </dd>
                                </dl>
                            </div>
                        </c:forEach>
                    </div>
                </article>
            </section>
            <div class="shell-main-footer">
                <span>我是底部栏</span>
            </div>
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

    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";

    if (username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "欢迎，" + username;
        login.href = "./userInfo.jsp";
    }

    /*TODO: 把登陆检查改到servlet中*/
    function toUserInfo() {
        if(username === "null") {
            alert("未登录，请先登录！")
        } else {
            window.location.href = "/reloadUserInfo"
        }
    }

    /*TODO: 把登陆检查改到servlet中*/
    function toAdmin() {
        if (username === "null") {
            alert("未登录，请先登录！");
        } else if (username !== "admin") {
            alert("对不起，您没有权限访问！");
        } else {
            window.location.href = "backstage.jsp";
        }
    }
</script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.5.1.min.js"></script>
<script>
    window.addEventListener('scroll', function () {
        let top = window.scrollY
        if (top !== 0) {
            $('.shell-top').css('top', '-100vh')
            $('.shell-main').css('top', '0')

        } else {
            $('.shell-top').css('top', '0px')
            $('.shell-main').css('top', '100vh')
        }
    })

</script>
</html>
