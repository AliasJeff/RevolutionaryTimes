package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.entity.User;
import com.zhexun.service.ArticleService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReloadUserInfoServlet", urlPatterns = "/reloadUserInfo")
public class ReloadUserInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        String username = (String) req.getSession().getAttribute("username");

        List<Article> myArticles = new ArrayList<>();
        ArticleService articleService = new ArticleServiceImpl();
        myArticles = articleService.getMyArticle(username);

        User user = new User();
        User self = new User();
        user.setUname(username);
        UserService userService = new UserServiceImpl();
        self = userService.getUserByCondition(user);

        req.setAttribute("self", self);
        req.setAttribute("myArticles", myArticles);
        req.setAttribute("msg", req.getParameter("msg"));
        req.getRequestDispatcher("/userInfo.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
