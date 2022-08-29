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
import java.util.Objects;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        User result = null;
        User user = new User();
        UserService userService = new UserServiceImpl();
        if (req.getParameter("account") != null && !Objects.equals(req.getParameter("account"), "") && req.getParameter("password") != null && !Objects.equals(req.getParameter("password"), "")) {
            user.setUname(req.getParameter("account"));
            user.setUpassword(req.getParameter("password"));
            result = userService.login(user.getUname(), user.getUpassword());
        }
        if (result != null) {    // 登陆成功
            /*把登录信息写入session*/
            HttpSession session = req.getSession();
            session.setAttribute("username", result.getUname());

            UserLogin userLogin = new UserLogin();
            userLogin.setUid(result.getUid());
            userLogin.setUname(result.getUname());

            req.setAttribute("msg", "登陆成功");

            //获取登陆页面所设定的访问路径
            String preUrl = (String) req.getSession().getAttribute("preUrl");
            if (Objects.equals(preUrl, "http://localhost:9999/indexForward.jsp"))
                preUrl = "index.jsp";
            //重定向到上一级页面
            resp.sendRedirect(preUrl);
        } else {    // 查询不到，登陆失败
            req.setAttribute("msg", "登陆失败，请检查用户名或密码！");
//            resp.sendRedirect("login.jsp");
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }
    }
}
