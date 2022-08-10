package com.zhexun.servlet;

import com.zhexun.dao.UserDao;
import com.zhexun.dao.impl.UserDaoImpl;
import com.zhexun.entity.Article;
import com.zhexun.entity.User;
import com.zhexun.entity.UserLogin;
import com.zhexun.service.ArticleService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ArticleServlet" ,urlPatterns = "/postArticle", value = "postArticle")
public class ArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");

        /*根据session中的用户名找到发布者的uid*/
        HttpSession session = req.getSession();
        User user = new User();
        user.setUname((String) session.getAttribute("username"));
//        user.setUname(req.getParameter("username"));
        UserService userService = new UserServiceImpl();
        int uid = userService.getUidByCondition(user);

        String title = req.getParameter("art-title");
        String content = req.getParameter("art-content");

        ArticleService articleService = new ArticleServiceImpl();
        boolean result = false;
        result = articleService.postArticle(uid, title, content);
        if(result) {
            resp.sendRedirect("login.jsp");
        } else {
            resp.sendError(402, "发布失败");
        }

    }
}
