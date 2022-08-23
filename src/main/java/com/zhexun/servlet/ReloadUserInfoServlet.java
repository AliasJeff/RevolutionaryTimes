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
        resp.setContentType("test/html;charset=utf-8");

        String username = (String) req.getSession().getAttribute("username");
        List<Article> myArticleList = new ArrayList<>();
        ArticleService articleService = new ArticleServiceImpl();
        myArticleList = articleService.getMyArticle(username);

        User user = new User();
        user.setUname(username);
        UserService userService = new UserServiceImpl();
        user = userService.getUserByCondition(user);

        if (myArticleList.size() > 0) req.setAttribute("myTitle1", myArticleList.get(0).getTitle());
        if (myArticleList.size() > 1) req.setAttribute("myTitle2", myArticleList.get(1).getTitle());
        if (myArticleList.size() > 2) req.setAttribute("myTitle3", myArticleList.get(2).getTitle());
        if (myArticleList.size() > 3) req.setAttribute("myTitle4", myArticleList.get(3).getTitle());
        if (myArticleList.size() > 4) req.setAttribute("myTitle5", myArticleList.get(4).getTitle());

        if (myArticleList.size() > 0) req.setAttribute("myContent1", myArticleList.get(0).getContent());
        if (myArticleList.size() > 1) req.setAttribute("myContent2", myArticleList.get(1).getContent());
        if (myArticleList.size() > 2) req.setAttribute("myContent3", myArticleList.get(2).getContent());
        if (myArticleList.size() > 3) req.setAttribute("myContent4", myArticleList.get(3).getContent());
        if (myArticleList.size() > 4) req.setAttribute("myContent5", myArticleList.get(4).getContent());

        if (myArticleList.size() > 0) req.setAttribute("myDate1", myArticleList.get(0).getDate());
        if (myArticleList.size() > 1) req.setAttribute("myDate2", myArticleList.get(1).getDate());
        if (myArticleList.size() > 2) req.setAttribute("myDate3", myArticleList.get(2).getDate());
        if (myArticleList.size() > 3) req.setAttribute("myDate4", myArticleList.get(3).getDate());
        if (myArticleList.size() > 4) req.setAttribute("myDate5", myArticleList.get(4).getDate());

        if (myArticleList.size() > 0) req.setAttribute("myView1", myArticleList.get(0).getView());
        if (myArticleList.size() > 1) req.setAttribute("myView2", myArticleList.get(1).getView());
        if (myArticleList.size() > 2) req.setAttribute("myView3", myArticleList.get(2).getView());
        if (myArticleList.size() > 3) req.setAttribute("myView4", myArticleList.get(3).getView());
        if (myArticleList.size() > 4) req.setAttribute("myView5", myArticleList.get(4).getView());

        if (myArticleList.size() > 0) req.setAttribute("myLike1", myArticleList.get(0).getLike());
        if (myArticleList.size() > 1) req.setAttribute("myLike2", myArticleList.get(1).getLike());
        if (myArticleList.size() > 2) req.setAttribute("myLike3", myArticleList.get(2).getLike());
        if (myArticleList.size() > 3) req.setAttribute("myLike4", myArticleList.get(3).getLike());
        if (myArticleList.size() > 4) req.setAttribute("myLike5", myArticleList.get(4).getLike());

        if (myArticleList.size() > 0) req.setAttribute("myCollect1", myArticleList.get(0).getCollect());
        if (myArticleList.size() > 1) req.setAttribute("myCollect2", myArticleList.get(1).getCollect());
        if (myArticleList.size() > 2) req.setAttribute("myCollect3", myArticleList.get(2).getCollect());
        if (myArticleList.size() > 3) req.setAttribute("myCollect4", myArticleList.get(3).getCollect());
        if (myArticleList.size() > 4) req.setAttribute("myCollect5", myArticleList.get(4).getCollect());

        req.setAttribute("upassword", user.getUpassword());
        req.setAttribute("uintroduce", user.getUintroduce());
        req.setAttribute("avatar", user.getAvatar());
        req.setAttribute("email", user.getEmail());
        req.setAttribute("birthday", user.getBirthday());
        req.setAttribute("access", user.getAccess());

        req.getRequestDispatcher("/userInfoForward.jsp").forward(req, resp);
    }
}
