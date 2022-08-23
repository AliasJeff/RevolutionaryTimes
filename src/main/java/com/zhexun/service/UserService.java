package com.zhexun.service;

import com.zhexun.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    User login(String account,String password);
    boolean register(String account, String password, String passwordConfirm) throws SQLException;
    boolean isValidAccount(String account) throws SQLException;
    boolean isValidPassword(String password, String passwordConfirm);
    User getUserByCondition(User user);
    List<User> getAllUser();
    boolean updateUser(String username, User newUser);
}
