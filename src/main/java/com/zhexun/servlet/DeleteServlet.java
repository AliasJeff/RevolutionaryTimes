package com.zhexun.servlet;

import com.zhexun.service.ArticleService;
import com.zhexun.service.CommentService;
import com.zhexun.service.PictureService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.CommentServiceImpl;
import com.zhexun.service.impl.PictureServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "deleteServlet", urlPatterns = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        int uid = 0, commentid = 0, articleid = 0, pictureid = 0;
        if(!Objects.equals(req.getParameter("uid"), "") && req.getParameter("uid") != null) {
            String id = (String) req.getParameter("uid");
            uid = Integer.parseInt(id);
        }
        if(!Objects.equals(req.getParameter("commentid"), "") && req.getParameter("commentid") != null) {
            String id = (String) req.getParameter("commentid");
            commentid = Integer.parseInt(id);
        }
        if(!Objects.equals(req.getParameter("articleid"), "") && req.getParameter("articleid") != null) {
            String id = (String) req.getParameter("articleid");
            articleid = Integer.parseInt(id);
        }
        if(!Objects.equals(req.getParameter("pictureid"), "") && req.getParameter("pictureid") != null) {
            String id = (String) req.getParameter("pictureid");
            pictureid = Integer.parseInt(id);
        }

        boolean success = false;
        if (uid != 0) {
            UserService userService = new UserServiceImpl();
            success = userService.deleteUser(uid);
            if(success) {
                req.setAttribute("msg", "删除成功！");

            } /*TODO: 失败提示信息，下同*/
        } else if(commentid != 0) {
            CommentService commentService = new CommentServiceImpl();
            success = commentService.deleteComment(commentid);
            if(success) {
                req.setAttribute("msg", "删除成功！");
            }
        } else if(articleid != 0) {
            ArticleService articleService = new ArticleServiceImpl();
            success = articleService.deleteArticle(articleid);
            if(success) {
                req.setAttribute("msg", "删除成功！");
            }
        } else if(pictureid != 0) {
            PictureService pictureService = new PictureServiceImpl();
            success = pictureService.deletePicture(pictureid);
            if (success) {
                req.setAttribute("msg", "删除成功！");
            }
        } else {
            req.setAttribute("msg", "操作失败！");
        }

        req.getRequestDispatcher("/reloadBackstage").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
