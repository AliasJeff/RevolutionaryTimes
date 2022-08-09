<%@ page import="com.zhexun.entity.UserLogin" %><%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-7-29
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
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
                    <ul class="art-list">
                        <li><a href="#"><span>文章1</span></a></li>
                        <li><a href="#"><span>文章2</span></a></li>
                        <li><a href="#"><span>文章3</span></a></li>
                        <li><a href="#"><span>文章4</span></a></li>
                        <li><a href="#"><span>文章5</span></a></li>
                        <li><a href="#"><span>文章6</span></a></li>
                        <li><a href="#"><span>文章7</span></a></li>
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
                <div class="art-right r">
                    <h2 class="art-txt">&nbsp;<span>最新文章</span></h2>
                    <div class="art-model">
                        <h3><a href="#">文章1</a></h3>
                        <p class="dateview"><span>发布时间：2016/10/18</span> <span>作者：lmlblog.com</span></p>
                        <dl class="img-txt">
                            <dt>
                                <img src="img/7.jpg" alt="文章1" title="文章1">
                            </dt>
                            <dd>
                                <p class="detail">　　
                                    内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容</p>
                                <a href="article.html" class="btn  c-fff">查看全文</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="art-model">
                        <h3><a href="#">文章2</a></h3>
                        <p class="dateview"><span>发布时间：2016/10/09</span> <span>作者：lmlblog.com</span></p>
                        <dl class="img-txt">
                            <dt>
                                <img src="img/8.jpg" alt="文章2" title="文章2">
                            </dt>
                            <dd>
                                <p class="detail">
                                    　　内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、</p>
                                <a href="#" class="btn  c-fff">查看全文</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="art-model">
                        <h3><a href="#">文章3</a></h3>
                        <p class="dateview"><span>发布时间：2016/10/19</span> <span>作者：lmlblog.com</span></p>
                        <dl class="img-txt">
                            <dt>
                                <img src="img/9.jpg" alt="文章3" title="文章3">
                            </dt>
                            <dd>
                                <p class="detail">　　
                                    内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、</p>
                                <a href="#" class="btn  c-fff">查看全文</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="art-model">
                        <h3><a href="#">文章4</a></h3>
                        <p class="dateview"><span>发布时间：2016/10/08</span> <span>作者：lmlblog.com</span></p>
                        <dl class="img-txt">
                            <dt>
                                <img src="img/6.jpg" alt="文章4" title="文章4">
                            </dt>
                            <dd>
                                <p class="detail">　　
                                    内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、</p>
                                <a href="#" class="btn  c-fff">查看全文</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="art-model">
                        <h3><a href="#">文章5</a></h3>
                        <p class="dateview"><span>发布时间：2016/10/30</span> <span>作者：lmlblog.com</span></p>
                        <dl class="img-txt">
                            <dt><img src="img/10.jpg" alt="文章5" title="文章5">
                            </dt>
                            <dd>
                                <p class="detail">
                                    　　内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、内容、</p>
                                <a href="#" class="btn  c-fff">查看全文</a>
                            </dd>
                        </dl>
                    </div>
                </div>
            </article>
        </section>
        <div class="shell-main-footer">
            <span>我是底部栏</span>
        </div>
    </div>


</div>

</body>
<script>
    var login = document.getElementById("login");
    var username = "<%=session.getAttribute("username")%>";

    if (username === "null") {
        login.innerHTML = "登录/注册";
    } else {
        login.innerHTML = "当前用户：" + username;
        login.href = "#";
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
