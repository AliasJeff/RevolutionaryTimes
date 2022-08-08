package com.zhexun.dao.impl;

import com.zhexun.dao.UserDao;
import com.zhexun.entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class UserDaoImpl implements UserDao {
    @Override
    public List<User> selectAllUser(Connection conn) {
        return null;
    }

    @Override
    public User selectUserByCondition(Connection conn, User user) {
        String sql = "select * from user where " + user.getQueryCondition();
        Statement statement = null;
        ResultSet rs = null;
        User result = new User();
        try {
            statement = conn.createStatement();
            rs = statement.executeQuery(sql);
            if (rs.next()) {
                result.setUid(rs.getInt("uid"));
                result.setUpassword(rs.getString("upassword"));
                result.setUname(rs.getString("uname"));
            } else {
                return null;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public boolean addUser(Connection conn, User user) throws SQLException {
        String sql = "INSERT INTO user(uname, upassword) VALUES('" + user.getUname() + "', '" + user.getUpassword() + "')";
        Statement st = null;
        int i = 0;
        try {
            st = conn.createStatement();
            i = st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return i != 0;
    }
}
