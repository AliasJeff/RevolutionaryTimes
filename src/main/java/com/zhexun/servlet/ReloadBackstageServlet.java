package com.zhexun.servlet;

import com.zhexun.entity.*;
import com.zhexun.service.*;
import com.zhexun.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReloadBackstageServlet", urlPatterns = "/reloadBackstage")
public class ReloadBackstageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        List<User> users;
        UserService userService = new UserServiceImpl();
        users = userService.getAllUser();

        List<Article> articles;
        ArticleService articleService = new ArticleServiceImpl();
        articles = articleService.selectAllArticle();

        List<Comment> comments;
        CommentService commentService = new CommentServiceImpl();
        comments = commentService.getAllComments();

        List<Course> courses;
        CourseService courseService = new CourseServiceImpl();
        courses = courseService.getAllCourse();

        List<Picture> pictures;
        PictureService pictureService = new PictureServiceImpl();
        pictures = pictureService.getAllPicture();

        req.setAttribute("users", users);
        req.setAttribute("articles", articles);
        req.setAttribute("comments", comments);
        req.setAttribute("courses", courses);
        req.setAttribute("pictures", pictures);
        req.setAttribute("msg", req.getParameter("msg"));
        req.getRequestDispatcher( "/backstage.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
