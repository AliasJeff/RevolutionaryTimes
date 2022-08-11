package com.zhexun.test;

import com.zhexun.dao.ArticleDao;
import com.zhexun.dao.UserDao;
import com.zhexun.dao.impl.ArticleDaoImpl;
import com.zhexun.dao.impl.UserDaoImpl;
import com.zhexun.entity.Article;
import com.zhexun.entity.User;
import com.zhexun.service.ArticleService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.ArticleServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;
import com.zhexun.servlet.ReloadArticleServlet;
import com.zhexun.util.JDBCUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Test {
    static UserDao userDao = new UserDaoImpl();
    static UserService userService = new UserServiceImpl();
//    static HttpServletRequest req;
//    static HttpSession session = req.getSession();
    static ArticleService articleService = new ArticleServiceImpl();
    static ArticleDao articleDao = new ArticleDaoImpl();

    public static void main(String[] args) {
        User user = new User();
//        session.setAttribute("username", "test");
        Article article = new Article();
        article.setUid(2);
        article.setTitle("标题标题标题");
        article.setContent("正文正文正文正文正文正文正文正文正文正文");
        List<Article> articles;


        Connection conn = JDBCUtil.getConnection();
//        articleDao.postArticle(conn, article);
        articles = articleService.selectAllArticle();

//        User result = userDao.selectUserByCondition(conn, user);
//        User result = userService.login("test", "123456");

        JDBCUtil.release(conn);
        for(Article art : articles) {
            System.out.println(art.getUid());
            System.out.println(art.getTitle());
            System.out.println(art.getContent());
            System.out.println();
        }
    }
}
