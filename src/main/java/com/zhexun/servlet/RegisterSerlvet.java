package com.zhexun.servlet;

import com.zhexun.entity.User;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet(name = "RegisterServlet" ,urlPatterns = "/register")
public class RegisterSerlvet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String passwordConfirm = req.getParameter("passwordConfirm");
        UserService userService = new UserServiceImpl();
        boolean result = false;
        try {
            result = userService.register(account, password, passwordConfirm);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result) {    // 注册成功;
            req.setAttribute("msg", "注册成功");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {    // 注册失败
            req.setAttribute("msg", "注册失败");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
