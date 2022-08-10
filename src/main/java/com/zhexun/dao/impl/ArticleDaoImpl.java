package com.zhexun.dao.impl;

import com.zhexun.dao.ArticleDao;
import com.zhexun.entity.Article;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class ArticleDaoImpl implements ArticleDao {
    @Override
    public boolean postArticle(Connection conn, Article article) {
        String sql = "INSERT INTO article(uid, title, content) VALUES(" + article.getUid() + ", '" + article.getTitle() + "', '" + article.getContent() + "')";
        System.out.println(sql);
        Statement st = null;
        int i = 0;
        try {
            st = conn.createStatement();
            i = st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return i != 0;
    }
}
