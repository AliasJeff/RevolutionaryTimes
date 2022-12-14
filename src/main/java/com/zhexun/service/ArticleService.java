package com.zhexun.service;

import com.zhexun.entity.Article;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    boolean postArticle(int uid, String uname, String title, String content, String date);
    List<Article> selectAllArticle();
    Article selectArticleByCondition(Article article);
    List<Article> getMyArticle(String name);
    List<Article> searchArticle(String s);
    boolean deleteArticle(int articleid);
}
