package com.zhexun.test;

import com.zhexun.dao.UserDao;
import com.zhexun.dao.impl.UserDaoImpl;
import com.zhexun.entity.User;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.UserServiceImpl;
import com.zhexun.util.JDBCUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;

public class Test {
    static UserDao userDao = new UserDaoImpl();
    static UserService userService = new UserServiceImpl();
    static HttpServletRequest req;

    public static void main(String[] args) {
        User user = new User();
        Connection conn = JDBCUtil.getConnection();
//        User result = userDao.selectUserByCondition(conn, user);
        User result = userService.login("test", "123456");
        JDBCUtil.release(conn);
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("username"));
    }
}
