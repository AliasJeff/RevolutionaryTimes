package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;
import com.zhexun.service.ArticleService;
import com.zhexun.service.CommentService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "searchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        String s = req.getParameter("content");
        List<Article> articles;
        ArticleService articleService = new ArticleServiceImpl();
        articles = articleService.searchArticle(s);

        req.setAttribute("articles", articles);
        req.getRequestDispatcher( "/allArticle.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
