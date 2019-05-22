<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.skynet.DB" %>
<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加留言</title>
</head>
<body>
<%--
处理添加留言的页面，添加成功跳转至留言板页面
添加失败则返回填写留言的界面
--%>
<%
    String username = (String) session.getAttribute("username");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    if (title != null && content != null) {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String sql = "insert into liuyan(username,content,title,date) value('" +
                username + "'," +
                "'" + content + "'," +
                "'"+title+"',"+
                "'" + simpleDateFormat.format(new Date()) + "')";

        int n = 0;
        try {
            DB db = new DB();
            Connection conn = db.getConnection();
            PreparedStatement psm = conn.prepareStatement(sql);

            n = 0;
            n = psm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //n != 0表示更新表成功
        if (n != 0) {
            out.print("留言成功");
            response.setHeader("refresh", "1;URL=liuyanban.jsp");
        }
    } else {
        out.print("留言失败");
        response.setHeader("refresh", "1;URL=liuyan.jsp");
    }
%>
</body>
</html>
