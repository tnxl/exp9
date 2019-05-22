<%@ page import="com.skynet.OP" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除</title>
</head>
<body>
<%
    OP op = new OP();
    String id = request.getParameter("id");
    boolean flag = op.delete(Integer.parseInt(id));
    if (flag)
    {
        out.print("删除成功!");
        response.setHeader("refresh","1;URL=liuyanban.jsp");
    }else{
        out.print("删除失败!");
        response.setHeader("refresh","1;URL=liuyanban.jsp");
    }
%>
</body>
</html>
