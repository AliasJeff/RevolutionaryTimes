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

@WebServlet(name = "ReloadArticleServlet", urlPatterns = "/reloadArticle")
public class ReloadArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String id = req.getParameter("Article");
        int articleid = Integer.parseInt(id);
        Article article = new Article();
        List<Comment> comments = new ArrayList<>();
        article.setArticleid(articleid);
        ArticleService articleService = new ArticleServiceImpl();
        CommentService commentService = new CommentServiceImpl();
        article = articleService.selectArticleByCondition(article);
        comments = commentService.getComments(article);

        req.setAttribute("article", article);
        req.setAttribute("comments", comments);
        req.getRequestDispatcher( "/article.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
