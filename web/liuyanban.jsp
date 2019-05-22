<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.skynet.DB" %>
<%@ page import="java.sql.SQLException" %>

<%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<%--
    留言板界面，显示所有的留言，可以添加新的留言，前提是已登录，否则跳转至登录界面
--%>
<%
    String sql = "select * from liuyan";

    DB db = new DB();
    Connection conn = db.getConnection();
    try {
        PreparedStatement psm = conn.prepareStatement(sql);

        ResultSet rs = psm.executeQuery();
        out.print("<table border='1'>");
        out.print("<tr>");
        out.print("<td>编号</td>");
        out.print("<td>姓名</td>");
        out.print("<td>标题</td>");
        out.print("<td>内容</td>");
        out.print("<td>日期</td>");
        out.print("<th colspan='2'>操作</th>");
        out.print("</tr>");
        while (rs.next()){
            out.print("<tr>");
            out.print("<td>"+rs.getInt("id")+"</td>");
            out.print("<td>"+rs.getString("username")+"</td>");
            out.print("<td>"+rs.getString("title")+"</td>");
            out.print("<td>"+rs.getString("content")+"</td>");
            out.print("<td>"+rs.getString("date")+"</td>");
            out.print("<td>"+"<a href='update.jsp?"+
                    "id="+rs.getInt("id")+"&"+
                    "usr="+rs.getString("username")+"&"+
                    "til="+rs.getString("title")+"&"+
                    "cont="+rs.getString("content")+
                    "'>修改</a>"+"</td>");
            out.print("<td>"+"<a href='delete.jsp?id=" +
                    rs.getInt("id") +"&"+
                    "usr="+rs.getString("username")+"&"+
                    "' onclick=del()>删除</a>"+"</td>");
            out.print("</tr>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

%>

<a href="liuyan.jsp">添加留言</a>



</body>
</html>
