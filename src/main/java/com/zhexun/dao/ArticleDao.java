package com.zhexun.dao;

import com.zhexun.entity.Article;

import java.sql.Connection;
import java.util.Date;

public interface ArticleDao {
    boolean postArticle(Connection conn, Article article);
}
