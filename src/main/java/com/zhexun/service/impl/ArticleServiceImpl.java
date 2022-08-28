package com.zhexun.service.impl;

import com.zhexun.dao.ArticleDao;
import com.zhexun.dao.impl.ArticleDaoImpl;
import com.zhexun.entity.Article;
import com.zhexun.service.ArticleService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ArticleServiceImpl implements ArticleService {
    ArticleDao articleDao = new ArticleDaoImpl();
    @Override
    public boolean postArticle(int uid, String uname, String title, String content, String date) {
        Article article = new Article();
        article.setUid(uid);
        article.setUname(uname);
        article.setTitle(title);
        article.setContent(content);
        article.setDate(date);
        Connection conn = JDBCUtil.getConnection();
        boolean result = false;
        result = articleDao.postArticle(conn, article);
        JDBCUtil.release(conn);
        return result;
    }

    @Override
    public List<Article> selectAllArticle() {
        List<Article> article;
        Connection conn = JDBCUtil.getConnection();
        article = articleDao.selectAllArticle(conn);
        JDBCUtil.release(conn);
        return article;
    }

    @Override
    public Article selectArticleByCondition(Article article) {
        Connection conn = JDBCUtil.getConnection();
        Article art = new Article();
        art = articleDao.selectArticleByCondition(conn, article);
        JDBCUtil.release(conn);
        return art;
    }

    @Override
    public List<Article> getMyArticle(String name) {
        Connection conn = JDBCUtil.getConnection();
        List<Article> articles;
        articles = articleDao.selectAllArticleByAuthor(conn, name);
        JDBCUtil.release(conn);
        return articles;
    }

    @Override
    public List<Article> searchArticle(String s) {
        Connection conn = JDBCUtil.getConnection();
        List<Article> article;
        article = articleDao.searchArticle(conn, s);
        JDBCUtil.release(conn);
        return article;
    }

    @Override
    public boolean deleteArticle(int articleid) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = articleDao.deleteArticle(conn, articleid);
        JDBCUtil.release(conn);
        return success;
    }
}
