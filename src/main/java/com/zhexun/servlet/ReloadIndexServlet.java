package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.service.ArticleService;
import com.zhexun.service.impl.ArticleServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReloadIndexServlet", urlPatterns = "/reloadIndex")
public class ReloadIndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");

        List<Article> articles;
        ArticleService articleService = new ArticleServiceImpl();
        articles = articleService.selectAllArticle();

        req.setAttribute("articles", articles);
        req.getRequestDispatcher( "/indexForward.jsp").forward(req,resp);
    }
}
