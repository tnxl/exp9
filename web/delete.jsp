<%@ page import="com.skynet.OP" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除</title>
</head>
<body>
<%
    String name = (String) session.getAttribute("username");
    String usr = request.getParameter("usr");
    String id = request.getParameter("id");
    if (name == null) {
        out.print("<script>alert('你未登录！');window.location.href='main.jsp';</script>");
    } else if (!usr.equals(name)) {
        out.print("<script>alert('你不具有删除该留言的资格');window.location.href='liuyanban.jsp';</script>");
    }
%>

<script>
    window.onload = function () {
        var msg = "确认删除？";
        if (confirm(msg)) {
           window.location.href="doDelete.jsp?id=<%=id%>";
        }else{
            window.location.href="liuyanban.jsp";
        }
    }
</script>

</body>
</html>
