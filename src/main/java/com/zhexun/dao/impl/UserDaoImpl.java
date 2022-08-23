package com.zhexun.dao.impl;

import com.zhexun.dao.UserDao;
import com.zhexun.entity.Article;
import com.zhexun.entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
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
                result.setUintroduce(rs.getString("uintroduce"));
                result.setAvatar(rs.getString("avatar"));
                result.setEmail(rs.getString("email"));
                result.setBirthday(rs.getString("birthday"));
                result.setAccess(rs.getString("access"));
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

    @Override
    public List<User> getAllUser(Connection conn) {
        int id = 100;
        int count = 100;
        List<User> userList = new ArrayList<>();
        User user = new User();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM user WHERE uid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    user.setUid(rs.getInt("uid"));
                    user.setUname(rs.getString("uname"));
                    user.setUpassword(rs.getString("upassword"));
                    user.setUintroduce(rs.getString("uintroduce"));
                    user.setAvatar(rs.getString("avatar"));
                    user.setEmail(rs.getString("email"));
                    user.setBirthday(rs.getString("birthday"));
                    user.setAccess(rs.getString("access"));
                    userList.add(new User(user));
                    count--;
                }
                id--;
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
        return userList;
    }

    @Override
    public boolean updateUser(Connection conn, String curUsername, User newUser) {
        String sql = "UPDATE user SET " + newUser.getUpdateQuery() + " WHERE uname='" + curUsername + "'";
        Statement statement = null;
        int rs;
        try {
            statement = conn.createStatement();
            rs = statement.executeUpdate(sql);
            return rs != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return true;
    }
}
