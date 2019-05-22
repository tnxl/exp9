<%@ page import="java.sql.*" %>
<%@ page import="com.skynet.DB" %><%--
  Created by IntelliJ IDEA.
  User: lsy
  Date: 2019/5/21
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录中...</title>
</head>
<body>
<%--
    处理登录的界面
--%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username!=null&&password!=null){

        String sql = "select * from lybtable";

        try {
            DB db = new DB();
            Connection conn = db.getConnection();
            PreparedStatement psm = conn.prepareStatement(sql);

            ResultSet rs = psm.executeQuery();
            while (rs.next()){
                String count = rs.getString("username");
                if (count.equals(username)){
                    String pwd = rs.getString("password");
                    if (pwd.equals(password)){
                        session.setAttribute("username",username);
                        session.setAttribute("password",password);
                        out.print("登录成功，即将跳转");
                        response.setHeader("refresh","1;URL=liuyan.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
%>
</body>
</html>
