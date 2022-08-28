package com.zhexun.dao;

import com.zhexun.entity.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    User selectUserByCondition(Connection conn,User user);
    boolean addUser(Connection conn, User user) throws SQLException;
    List<User> getAllUser(Connection conn);
    boolean updateUser(Connection conn, String curUsername, User newUser);
    boolean deleteUser(Connection conn, int uid);
}
