package com.zhexun.servlet;

import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;
import com.zhexun.entity.User;
import com.zhexun.service.ArticleService;
import com.zhexun.service.CommentService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.CommentServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "issueCommentServlet", urlPatterns = "/issueComment")
public class IssueCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        int articleid = 0, uoid = 0;
        if(!Objects.equals(req.getParameter("id"), "") && req.getParameter("id") != null) {
            String id = (String) req.getParameter("id");
            articleid = Integer.parseInt(id);
        }
        if(!Objects.equals(req.getParameter("uoid"), "") && req.getParameter("uoid") != null) {
            String id = (String) req.getParameter("uoid");
            uoid = Integer.parseInt(id);
        }

        /*根据session中的用户名找到发布者的uid*/
        HttpSession session = req.getSession();
        User user = new User();
        user.setUname((String) session.getAttribute("username"));
        UserService userService = new UserServiceImpl();
        user = userService.getUserByCondition(user);

        Article article = new Article();
        ArticleService articleService = new ArticleServiceImpl();
        article.setArticleid(articleid);
        article = articleService.selectArticleByCondition(article);

        Comment comment = new Comment();
        comment.setArticleid(articleid);
        comment.setArticleTitle(article.getTitle());
        comment.setUid(user.getUid());
        comment.setUname(user.getUname());
//        comment.setCommentContent(req.getParameter("textComment"));
        comment.setDate(req.getParameter("date"));

        if(uoid != 0) {
            User obj = new User();
            obj.setUid(uoid);
            obj = userService.getUserByCondition(obj);
            comment.setUoid(uoid);
            comment.setUoname(obj.getUname());
            comment.setCommentContent(req.getParameter("replyContent"));
        } else {
            comment.setCommentContent(req.getParameter("textComment"));
        }

        CommentService commentService = new CommentServiceImpl();
        boolean result = commentService.issueComment(comment);
        if(result) {
            req.setAttribute("msg", "发布成功！");
            String preUrl = "/reloadArticle?Article=" + article.getArticleid();
            resp.sendRedirect(preUrl);
        } else {
            req.setAttribute("msg", "发布失败！");
            String preUrl = "/reloadArticle?Article=" + article.getArticleid();
            req.getRequestDispatcher(preUrl).forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
