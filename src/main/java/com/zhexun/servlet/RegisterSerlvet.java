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

@WebServlet(name = "RegisterServlet" ,urlPatterns = "/register")
public class RegisterSerlvet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");
        User user = new User();
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
            req.getSession().setAttribute("user", result);

//            resp.setContentType("text/html;charset=UTF-8");
//            PrintWriter out=resp.getWriter();
//            out.println("<!DOCTYPE HTML>");
//            out.println("<HTML>");
//            out.println("<HEAD><TITLE>新增会员成功</TITLE></HEAD>");
//            out.println("<BODY>");
//            out.println("<h2>会员,"+req.getParameter("account")+"注册成功</h2>");
//            List<String> list=(List<String>) req.getAttribute("errors");
//            out.println("<a href=\""+req.getContextPath()+"/index.jsp\">返回首页登录</a>");
//            out.println("</BODY>");
//            out.println("</HTML>");

            resp.sendRedirect("login.jsp");
        }
//        else {    // 注册失败
//            resp.sendRedirect("login.jsp");
//        }
    }
}
