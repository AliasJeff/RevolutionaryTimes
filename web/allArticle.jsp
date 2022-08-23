<%--
  Created by IntelliJ IDEA.
  User: 86130
  Date: 2022-8-15
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部文章</title>
</head>
<body>
<form id="formAllArticle" autocomplete="off" action="" method="post">

</form>
</body>
<script>
    document.getElementById("formAllArticle").action = "/reloadAllArticle";
    document.getElementById("formAllArticle").submit();

</script>
</html>
