package com.skynet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OP {

    public boolean update(String id, String content) {
        String sql = "update liuyan set content = ? where id=" + id;
        Connection conn = new DB().getConnection();
        int n = 0;
        try {
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, content);
            n = psm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n != 0;
    }

    public boolean delete(int id) {
        String sql = "delete from liuyan where id=?";
        Connection conn = new DB().getConnection();
        int n = 0;
        try {
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(1, id);
            n = psm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n != 0;
    }

    public boolean register(String username, String password) {
        String sql = "select * from lybtable where username = ?";
        Connection conn = new DB().getConnection();
        int n = 0;
        try {
            PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(1, username);
            ResultSet rs = psm.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                sql = "insert into lybtable(username,password) value(" +
                        "'" + username + "'," +
                        "'" + password + "'" +
                        ")";
                psm = conn.prepareStatement(sql);
                n = psm.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n != 0;

    }

}
