<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-6
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <link rel="stylesheet" href="./css/nav.css">
    <link rel="stylesheet" href="./css/all.css">
</head>

<body>
<form id="formArticle" autocomplete="off" action="" method="post">
    <textarea id="articleTitle" name="articleTitle"></textarea>
</form>
</body>
<script>
    var title = "<%=request.getParameter("Article")%>";
    document.getElementById("articleTitle").innerText = title;
    document.getElementById("formArticle").action = "/reloadArticle";
    document.getElementById("formArticle").submit();


</script>
</html>