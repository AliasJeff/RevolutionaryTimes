package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;
import com.zhexun.service.ArticleService;
import com.zhexun.service.CourseService;
import com.zhexun.service.PictureService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.CourseServiceImpl;
import com.zhexun.service.impl.PictureServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="ReloadAllArticleServlet", urlPatterns = "/reloadAllArticle")
public class ReloadAllArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        List<Article> articles;
        ArticleService articleService = new ArticleServiceImpl();
        articles = articleService.selectAllArticle();

        List<Course> courses;
        CourseService courseService = new CourseServiceImpl();
        courses = courseService.getAllCourse();

        List<Picture> pictures;
        PictureService pictureService = new PictureServiceImpl();
        pictures = pictureService.getAllPicture();

        req.setAttribute("articles", articles);
        req.setAttribute("courses", courses);
        req.setAttribute("pictures", pictures);
        req.getRequestDispatcher( "/allArticle.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
