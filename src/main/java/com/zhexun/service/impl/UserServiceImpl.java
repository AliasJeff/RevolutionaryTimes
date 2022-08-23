package com.zhexun.service.impl;

import com.zhexun.dao.UserDao;
import com.zhexun.dao.impl.UserDaoImpl;
import com.zhexun.entity.User;
import com.zhexun.service.UserService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String account, String password) {
        User user = new User();
        user.setUname(account);
        user.setUpassword(password);
        Connection conn = JDBCUtil.getConnection();
        User result = userDao.selectUserByCondition(conn, user);
        JDBCUtil.release(conn);
        return result;
    }

    @Override
    public boolean register(String account, String password, String passwordConfirm) throws SQLException {
        User user = new User();
        boolean result = false;
        if(isValidAccount(account) && isValidPassword(password, passwordConfirm)) {
            user.setUname(account);
            user.setUpassword(password);
            Connection conn = JDBCUtil.getConnection();
            result = userDao.addUser(conn, user);
            JDBCUtil.release(conn);
        }
        return result;
    }

    /**
     * 检查用户名是否有效
     * @param account
     * @return
     * @throws SQLException
     */
    @Override
    public boolean isValidAccount(String account) throws SQLException {
        User user = new User();
        user.setUname(account);
        Connection conn = JDBCUtil.getConnection();
        User result = userDao.selectUserByCondition(conn, user);
        JDBCUtil.release(conn);
        if (account == null || account.equals("")) return false;
        else return result == null;
    }

    /**
     * 检查密码是否有效
     * @param password
     * @param passwordConfirm
     * @return
     */
    @Override
    public boolean isValidPassword(String password, String passwordConfirm) {
        if (password == null || password.equals("") || passwordConfirm == null || passwordConfirm.equals("")) {
            return false;
        } else {
            return password.equals(passwordConfirm);
        }
    }

    @Override
    public User getUserByCondition(User user) {
        Connection conn = JDBCUtil.getConnection();
        User result = userDao.selectUserByCondition(conn, user);
        JDBCUtil.release(conn);
        return result;
    }

    @Override
    public List<User> getAllUser() {
        Connection conn = JDBCUtil.getConnection();
        List<User> result = userDao.getAllUser(conn);
        JDBCUtil.release(conn);
        return result;
    }

    @Override
    public boolean updateUser(String username, User newUser) {
        Connection conn = JDBCUtil.getConnection();
        boolean result = userDao.updateUser(conn, username, newUser);
        JDBCUtil.release(conn);
        return result;
    }
}
