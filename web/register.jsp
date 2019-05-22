<%@ page import="com.skynet.OP" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    OP op = new OP();
    boolean flag = op.register(username,password);
    if (flag){
        out.print("注册成功");
        response.setHeader("refresh","1;URL=main.jsp");
    }else{
        out.print("注册失败");
        response.setHeader("refresh","1;URL=main.jsp");
    }
%>
</body>
</html>
