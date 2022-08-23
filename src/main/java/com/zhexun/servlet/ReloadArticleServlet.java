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

@WebServlet(name = "ReloadArticleServlet", urlPatterns = "/reloadArticle")
public class ReloadArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");

        String articleTitle = req.getParameter("articleTitle");
        Article article = new Article();
        article.setTitle(articleTitle);
        ArticleService articleService = new ArticleServiceImpl();
        article = articleService.selectArticleByCondition(article);

        req.setAttribute("articleUid", article.getUid());
        req.setAttribute("articleUname", article.getUname());
        req.setAttribute("articleTitle", article.getTitle());
        req.setAttribute("articleContent", article.getContent());
        req.setAttribute("articleDate", article.getDate());
        req.setAttribute("articleView", article.getView());
        req.setAttribute("articleLike", article.getLike());
        req.setAttribute("articleCollect", article.getCollect());
        req.setAttribute("articleCover", article.getCover());

        req.getRequestDispatcher( "/articleForward.jsp").forward(req,resp);

    }
}
