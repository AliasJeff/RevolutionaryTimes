package com.zhexun.servlet;

import com.zhexun.entity.User;
import com.zhexun.entity.UserLogin;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet" ,urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");
        User user = new User();
        user.setUname(req.getParameter("account"));
        user.setUpassword(req.getParameter("password"));
        UserService userService = new UserServiceImpl();
        User result = null;
        result = userService.login(user.getUname(), user.getUpassword());
        if (result != null) {    // 登陆成功
//            req.getSession().setAttribute("username", result.getUname());

            /*把登录信息写入session*/
            HttpSession session = req.getSession();
            session.setAttribute("username", result.getUname());

            UserLogin userLogin = new UserLogin();
            userLogin.setUid(result.getUid());
            userLogin.setUname(result.getUname());
            resp.sendRedirect("index.jsp");
        } else {    // 查询不到，登陆失败
            resp.sendRedirect("login.jsp");
        }
    }
}
