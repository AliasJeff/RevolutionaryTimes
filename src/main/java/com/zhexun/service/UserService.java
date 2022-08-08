package com.zhexun.service;

import com.zhexun.entity.User;

import java.sql.SQLException;

public interface UserService {
    User login(String account,String password);

    boolean register(String account, String password, String passwordConfirm) throws SQLException;

    boolean isValidAccount(String account) throws SQLException;

    boolean isValidPassword(String password, String passwordConfirm);
}
