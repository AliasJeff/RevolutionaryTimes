<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册登录界面</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
<div class="container">
    <div class="welcome">
        <div class="pinkbox">
            <!-- 注册 -->
            <div class="signup nodisplay">
                <h1>注册</h1>
                <br>
                <form autocomplete="off" action="/register" method="post">
                    <input type="text" placeholder="用户名" name="account">
                    <input type="password" placeholder="密码" name="password">
                    <input type="password" placeholder="确认密码" name="passwordConfirm">
                    <button class="button submit">创建账号</button>
                </form>
            </div>

            <!-- 登录 -->
            <div class="signin">
                <h1>登录</h1>
                <form class="more-padding" autocomplete="off" action="/login" method="post">
                    <input type="text" placeholder="用户名" name="account">
                    <input type="password" placeholder="密码" name="password">
                    <div class="checkbox">
                        <input type="checkbox" id="remember" /><label for="remember">记住密码</label>
                    </div>
                    <button class="buttom sumbit">登录</button>
                </form>
            </div>
        </div>

        <div class="leftbox">
            <h2 class="title"><span>BLOOM</span>&<br>BOUQUET</h2>
            <p class="desc">Pick your perfect <span>bouquet</span></p>
            <img class="flower smaller" src="https://hbimg.huabanimg.com/c09305167a883e60179a45374df73252304001359acca-W3qbYm_fw658/format/webp" />
            <p class="account">已有帐号?</p>
            <button class="button" id="signin">登录</button>
        </div>

        <div class="rightbox">
            <h2 class="title"><span>BLOOM</span>&<br>BOUQUET</h2>
            <p class="desc">Pick your perfect <span>bouquet</span></p>
            <img class="flower" src="https://hbimg.huabanimg.com/b28be92c8198975a74ad656eba00b352c9b9e589819af-lDXUAS_fw658/format/webp" />
            <p class="account">没有账号?</p>
            <button class="button" id="signup">注册</button>
        </div>
    </div>
</div>

<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script><script src="./js/login.js"></script>
</body>
</html>
