<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言界面</title>
    <style>
        form {
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("username")==null){
        out.print("<script>alert('你还未登录');window.location.href='main.jsp';</script>");
    }
%>
<form action="addLiuyan.jsp">
    留言标题：<input type="text" name="title"><br>
    留言内容：<textarea name="content"></textarea><br>
    <input type="submit" value="提交留言">
    <input type="reset" value="清空">
</form>

</body>
</html>
