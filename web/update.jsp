<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改留言</title>
</head>
<body>
<%
    String name = (String) session.getAttribute("username");
    String own = request.getParameter("usr");
    String title = request.getParameter("til");
    String content = request.getParameter("cont");
    String id = request.getParameter("id");
    if (name==null){
        out.print("<script>alert('你未登录！');window.location.href='main.jsp';</script>");
    }else if (!own.equals(name)){
        out.print("<script>alert('你不具有修改该留言的资格');window.location.href='liuyanban.jsp';</script>");
    }


%>

<form action="doUpdate.jsp?id=<%=id%>" method="post">
    留言用户：<input type="text" value="<%=own%>" disabled><br>
    留言标题：<input type="text" value="<%=title%>" disabled><br>
    留言内容：<input type="text" name="content" value="<%=content%>"><br>
    <input type="submit" value="提交修改">
</form>
</body>
</html>
