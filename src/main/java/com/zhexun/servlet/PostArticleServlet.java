package com.zhexun.servlet;

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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "PostArticleServlet", urlPatterns = "/postArticle")
public class PostArticleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        /*根据session中的用户名找到发布者的uid*/
        HttpSession session = req.getSession();
        User user = new User();
        user.setUname((String) session.getAttribute("username"));
//        user.setUname(req.getParameter("username"));
        UserService userService = new UserServiceImpl();
        user = userService.getUserByCondition(user);
        int uid = user.getUid();
        String uname = (String) session.getAttribute("username");
        String title = req.getParameter("art-title");
        String content = req.getParameter("art-content");
        String date = req.getParameter("date");

        ArticleService articleService = new ArticleServiceImpl();
        boolean result = false;
        result = articleService.postArticle(uid, uname, title, content, date);

        //获取登陆页面所设定的访问路径
        String preUrl = (String) req.getSession().getAttribute("preUrl");
        if(Objects.equals(preUrl, "http://localhost:9999/indexForward.jsp"))
            preUrl = "index.jsp";
        if(result) {
            req.setAttribute("msg", "发布成功！");
            //重定向到上一级页面
            resp.sendRedirect(preUrl);
        } else {
            req.setAttribute("msg", "发布失败！");
            //重定向到上一级页面
            req.getRequestDispatcher("./postArticle.jsp").forward(req,resp);
        }
        // TODO: else上传失败

    }
}
