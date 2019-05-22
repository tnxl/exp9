<%@ page import="com.skynet.OP" %>
<%@ page import="java.nio.charset.StandardCharsets" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改留言...</title>
</head>
<body>

<%
    OP op = new OP();
    String id = request.getParameter("id");
    String content = request.getParameter("content");
    content = new String(content.getBytes("8859_1"), StandardCharsets.UTF_8);
    boolean flag = op.update(id,content);
    if (flag){
        out.print("修改成功！");
        response.setHeader("refresh","1;URL=liuyanban.jsp");
    }else{
        out.print("修改失败！");
        response.setHeader("refresh","1;URL=update.jsp");
    }
%>

</body>
</html>
