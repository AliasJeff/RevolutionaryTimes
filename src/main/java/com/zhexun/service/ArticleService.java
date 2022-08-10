package com.zhexun.service;

import java.util.Date;

public interface ArticleService {
    boolean postArticle(int uid, String title, String content);
}
