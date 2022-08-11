package com.zhexun.service.impl;

import com.zhexun.dao.ArticleDao;
import com.zhexun.dao.impl.ArticleDaoImpl;
import com.zhexun.entity.Article;
import com.zhexun.service.ArticleService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

public class ArticleServiceImpl implements ArticleService {
    ArticleDao articleDao = new ArticleDaoImpl();
    @Override
    public boolean postArticle(int uid, String title, String content) {
        Article article = new Article();
        article.setUid(uid);
        article.setTitle(title);
        article.setContent(content);
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
}
