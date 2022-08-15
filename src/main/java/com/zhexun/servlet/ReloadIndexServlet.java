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

        List<Article> article;
        ArticleService articleService = new ArticleServiceImpl();
        article = articleService.selectAllArticle();

        req.setAttribute("uname1", article.get(0).getUname());
        req.setAttribute("uname2", article.get(1).getUname());
        req.setAttribute("uname3", article.get(2).getUname());
        req.setAttribute("uname4", article.get(3).getUname());
        req.setAttribute("uname5", article.get(4).getUname());

        req.setAttribute("title1", article.get(0).getTitle());
        req.setAttribute("title2", article.get(1).getTitle());
        req.setAttribute("title3", article.get(2).getTitle());
        req.setAttribute("title4", article.get(3).getTitle());
        req.setAttribute("title5", article.get(4).getTitle());

        req.setAttribute("content1", article.get(0).getContent());
        req.setAttribute("content2", article.get(1).getContent());
        req.setAttribute("content3", article.get(2).getContent());
        req.setAttribute("content4", article.get(3).getContent());
        req.setAttribute("content5", article.get(4).getContent());

        req.setAttribute("date1", article.get(0).getDate());
        req.setAttribute("date2", article.get(1).getDate());
        req.setAttribute("date3", article.get(2).getDate());
        req.setAttribute("date4", article.get(3).getDate());
        req.setAttribute("date5", article.get(4).getDate());

        req.setAttribute("article", article);
        req.getRequestDispatcher( "/indexForward.jsp").forward(req,resp);
    }
}
