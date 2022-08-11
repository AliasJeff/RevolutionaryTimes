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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReloadArticleServlet", urlPatterns = "/reloadArticle")
public class ReloadArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("test/html;charset=utf-8");
        List<Article> article;
        List<String> title = new ArrayList<>();
        ArticleService articleService = new ArticleServiceImpl();
        article = articleService.selectAllArticle();
        for(Article art : article) {
            title.add(new String(art.getTitle()));
        }
        System.out.println(title);
        req.setAttribute("title", title);
        req.getRequestDispatcher( "/index.jsp").forward(req,resp);
    }
}
