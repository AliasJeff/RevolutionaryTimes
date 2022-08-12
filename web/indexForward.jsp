<%@ page import="com.zhexun.entity.UserLogin" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.zhexun.entity.Article" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li><a href="./userInfo.jsp">个人中心</a></li>
                    <li><a href="./make.html">xxxx</a></li>
                    <%--TODO: 支持发布视频、图片、文章--%>
                    <li><a href="./postArticle.jsp">发布文章</a></li>
                    <li><a id="login" href="./login.jsp"></a></li>
                    <div class="nav-box"></div>
                </ul>
            </div>
            <div class="embellish">
                <a class="rocket"></a>
                <div class="aside"></div>
            </div>
            <section>
                <div class="banner-box clearfix">
                    <div class="banner r">
                        <div>
                            <a class="a-img-ban img-ban-curr"><img class="img-ban" src="./image/image/1.jpg"></a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/image/2.jpg"></a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/image/3.jpg"></a>
                            <a class="a-img-ban"><img class="img-ban" src="./image/image/4.jpg"></a>
                        </div>
                        <ul class="r">
                            <li class="li-img curr"><img src="./image/image/1.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/image/2.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/image/3.jpg">
                                <div class="mask"></div>
                            </li>
                            <li class="li-img"><img src="./image/image/4.jpg">
                                <div class="mask"></div>
                            </li>
                        </ul>
                    </div>
                    <div class="art l">
                        <h2 class="art-txt"><span>推荐文章</span></h2>
                        <ul class="art-list" id="art-list">
                            <%--                            <li><a href="#"><span>文章1</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章2</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章3</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章4</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章5</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章6</span></a></li>--%>
                            <%--                            <li><a href="#"><span>文章7</span></a></li>--%>

                            <%--                            <c:forEach items="${requestScope.title}" var="item" varStatus="id">--%>
                            <%--                                <li><a href="#"><span>${id.index} ${item}</span></a></li>--%>
                            <%--                            </c:forEach>--%>
                        </ul>
                    </div>
                </div>
                <article>
                    <aside class="left-box l">
                        <div class="art Label clearfix">
                            <h2 class="art-txt"><span>热门标签</span></h2>
                            <div>
                                <a class="btn label" href="#">标签1</a>
                                <a class="btn label" href="#">标签2</a>
                                <a class="btn label" href="#">标签3</a>
                                <a class="btn label" href="#">标签4</a>
                                <a class="btn label" href="#">标签5</a>
                                <a class="btn label" href="#">标签6</a>
                                <a class="btn label" href="#">标签7</a>
                                <a class="btn label" href="#">标签8</a>
                            </div>
                        </div>
                        <div class="art Link mt20 clearfix">
                            <h2 class="art-txt"><span>个人信息</span></h2>
                            <ul class="art-list">
                                <li><a href="#"><span>个人中心</span></a></li>
                                <li><a href="#"><span>我的收藏</span></a></li>
                                <li><a href="#"><span>我的发布</span></a></li>
                                <li><a href="#"><span>消息中心</span></a></li>
                                <li><a href="admin.jsp"><span>管理员界面</span></a></li>
                                <li><a href="logout.jsp"><span>退出登录</span></a></li>
                            </ul>

                        </div>
                    </aside>
                    <div class="art-right r" id="art-right r">

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
<script>
    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";
    var title1, title2, title3, title4, title5, title6, title7;
    var content1, content2, content3, content4, content5, content6, content7;
    var uname1, uname2, uname3, uname4, uname5, uname6, uname7;
    var date1, date2, date3, date4, date5, date6, date7;

    var articleTitle = [];
    var articleContent = [];
    var articleDate = [];
    var articleView = [];
    var articleLike = [];
    var articleCollect = [];

    if (username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "当前用户：" + username;
        login.href = "#";
    }

    <%--        <%--%>
    <%--        List<Article> articles = (List<Article>) request.getAttribute("article");--%>
    <%--//       List<Article> articles = new ArrayList<>();--%>
    <%--        for(int i = 0; i < articles.size(); i++) {%>--%>
    <%--        articleTitle[<%=i%>] = <%=((String) articles.get(i).getTitle())%>;--%>
    <%--        articleContent[<%=i%>] = <%=((String) articles.get(i).getContent())%>;--%>
    <%--        articleDate[<%=i%>] = <%=((Date) articles.get(i).getDate())%>;--%>
    <%--        articleView[<%=i%>] = <%=((int) articles.get(i).getView())%>;--%>
    <%--        articleLike[<%=i%>] = <%=((int) articles.get(i).getLike())%>;--%>
    <%--        articleCollect[<%=i%>] = <%=((int) articles.get(i).getCollect())%>;--%>
    <%--        <%}%>--%>

    uname1 = "<%=request.getAttribute("uname1")%>";
    uname2 = "<%=request.getAttribute("uname2")%>";
    uname3 = "<%=request.getAttribute("uname3")%>";

    title1 = "<%=request.getAttribute("title1")%>";
    title2 = "<%=request.getAttribute("title2")%>";
    title3 = "<%=request.getAttribute("title3")%>";

    content1 = "<%=request.getAttribute("content1")%>";
    content2 = "<%=request.getAttribute("content2")%>";
    content3 = "<%=request.getAttribute("content3")%>";

    date1 = "<%=request.getAttribute("date1")%>";
    date2 = "<%=request.getAttribute("date2")%>";
    date3 = "<%=request.getAttribute("date3")%>";

    var info = '';
    info = '<li><a href="#"><span>' + title1 + '</span></a></li>' +
        '<li><a href="#"><span>' + title2 + '</span></a></li>' +
        '<li><a href="#"><span>' + title3 + '</span></a></li>';
    document.getElementById("art-list").innerHTML = info;

    /*TODO: 传列表，展示获赞、阅读、收藏数*/
    info = '<h2 class="art-txt"><span>最新文章</span></h2>' +
        '<div class="art-model">' +
        '<h3><a href="#">' + title1 + '</a></h3>' +
        '<p class="dateview"><span>' + '发布时间：' + date1 + '</span> <span>' + '作者：' + uname1 + '</span></p>' +
        '<dl class="img-txt">' +
        '<dt>' +
        '<img src="img/7.jpg" alt="文章1" title="文章1">' +
        '</dt>' +
        '<dd>' +
        '<p class="detail">' + content1 + '</p>' +
        '<a href="article.html" class="btn  c-fff">查看全文</a>' +
        '</dd>' +
        '</dl>' +
        '</div>' +

        '<div class="art-model">' +
        '<h3><a href="#">' + title2 + '</a></h3>' +
        '<p class="dateview"><span>' + '发布时间：' + date2 + '</span> <span>' + '作者：' + uname2 + '</span></p>' +
        '<dl class="img-txt">' +
        '<dt>' +
        '<img src="img/7.jpg" alt="文章1" title="文章1">' +
        '</dt>' +
        '<dd>' +
        '<p class="detail">' + content2 + '</p>' +
        '<a href="article.html" class="btn  c-fff">查看全文</a>' +
        '</dd>' +
        '</dl>' +
        '</div>' +

        '<div class="art-model">' +
        '<h3><a href="#">' + title3 + '</a></h3>' +
        '<p class="dateview"><span>' + '发布时间：' + date3 + '</span> <span>' + '作者：' + uname3 + '</span></p>' +
        '<dl class="img-txt">' +
        '<dt>' +
        '<img src="img/7.jpg" alt="文章1" title="文章1">' +
        '</dt>' +
        '<dd>' +
        '<p class="detail">' + content3 + '</p>' +
        '<a href="article.html" class="btn  c-fff">查看全文</a>' +
        '</dd>' +
        '</dl>' +
        '</div>';

    document.getElementById("art-right r").innerHTML = info;


</script>

</html>
