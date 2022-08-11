package com.zhexun.service;

import com.zhexun.entity.Article;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    boolean postArticle(int uid, String title, String content);
    List<Article> selectAllArticle();
}
