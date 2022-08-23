package com.zhexun.dao;

import com.zhexun.entity.Article;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

public interface ArticleDao {
    boolean postArticle(Connection conn, Article article);
    List<Article> selectAllArticle(Connection conn);
    Article selectArticleByCondition(Connection conn, Article article);
    List<Article> selectAllArticleByAuthor(Connection conn, String name);
}
