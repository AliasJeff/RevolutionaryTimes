<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-9
  Time: 13:48
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
<body>
<form id="form" autocomplete="off" action="/reloadUserInfo" method="post">

</form>
</body>
<script>
    var username = "<%=session.getAttribute("username")%>";

    if (username === "null") {
        alert("未登录，请先登录！");
        window.history.back();
    } else {
        document.getElementById("form").submit();
    }
</script>
</html>
