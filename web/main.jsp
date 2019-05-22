<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户界面</title>
    <style>
        body{
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<form action="login.jsp" name="form1" method="post">
    账号：<input type="text" name="username"><br>
    密码：<input type="text" name="password"><br>
    <input type="submit" value="登录">
    <a href="register.jsp">
        <button onclick="reg()">注册</button>
    </a>
</form>
<script>
    function reg() {
        document.form1.action = "register.jsp";
        document.form1.submit();
    }
</script>
</body>
</html>
