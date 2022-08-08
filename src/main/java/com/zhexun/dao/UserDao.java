package com.zhexun.dao;

import com.zhexun.entity.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    List<User> selectAllUser(Connection conn);
    User selectUserByCondition(Connection conn,User user);
    boolean addUser(Connection conn, User user) throws SQLException;
}
