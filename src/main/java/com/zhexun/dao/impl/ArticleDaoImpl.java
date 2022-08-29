package com.zhexun.dao.impl;

import com.zhexun.dao.ArticleDao;
import com.zhexun.entity.Article;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ArticleDaoImpl implements ArticleDao {
    @Override
    public boolean postArticle(Connection conn, Article article) {
        String sql = "INSERT INTO article(uid, uname, title, content, date) VALUES(" + article.getUid() + ", '" + article.getUname() + "', '" + article.getTitle() + "', '" + article.getContent() + "', '" + article.getDate() + "')";
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

    @Override
    public List<Article> selectAllArticle(Connection conn) {
        int id = 100;
        int count = 100;
        List<Article> articles = new ArrayList<>();
        Article art = new Article();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM article WHERE articleid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    art.setArticleid(rs.getInt("articleid"));
                    art.setUid(rs.getInt("uid"));
                    art.setUname(rs.getString("uname"));
                    art.setTitle(rs.getString("title"));
                    art.setContent(rs.getString("content"));
                    art.setDate(rs.getString("date"));
                    art.setView(rs.getInt("view"));
                    art.setLike(rs.getInt("like"));
                    art.setCollect(rs.getInt("collect"));
                    art.setCover(rs.getString("cover"));
                    articles.add(new Article(art));
                    count--;
                }
                id--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return articles;
    }

    @Override
    public Article selectArticleByCondition(Connection conn, Article article) {
        String sql = "SELECT * FROM article WHERE " + article.getQueryCondition();
        Statement statement = null;
        ResultSet rs = null;
        Article result = new Article();
        try {
            statement = conn.createStatement();
            rs = statement.executeQuery(sql);
            if (rs.next()) {
                result.setArticleid(rs.getInt("articleid"));
                result.setUid(rs.getInt("uid"));
                result.setUname(rs.getString("uname"));
                result.setTitle(rs.getString("title"));
                result.setContent(rs.getString("content"));
                result.setDate(rs.getString("date"));
                result.setView(rs.getInt("view"));
                result.setLike(rs.getInt("like"));
                result.setCollect(rs.getInt("collect"));
                result.setCover(rs.getString("cover"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return result;
    }

    @Override
    public List<Article> selectAllArticleByAuthor(Connection conn, String name) {
        int id = 100;
        int count = 100;
        List<Article> articles = new ArrayList<>();
        Article art = new Article();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM article WHERE uname='" + name + "'" + "and articleid =" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    art.setUid(rs.getInt("uid"));
                    art.setUname(rs.getString("uname"));
                    art.setTitle(rs.getString("title"));
                    art.setContent(rs.getString("content"));
                    art.setDate(rs.getString("date"));
                    art.setView(rs.getInt("view"));
                    art.setLike(rs.getInt("like"));
                    art.setCollect(rs.getInt("collect"));
                    art.setCover(rs.getString("cover"));
                    articles.add(new Article(art));
                    count--;
                }
                id--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return articles;
    }

    @Override
    public List<Article> searchArticle(Connection conn, String s) {
        String sql = "SELECT * FROM article WHERE title LIKE '%" + s + "%' or content LIKE '%" + s + "%'";
        Article art = new Article();
        List<Article> articles = new ArrayList<>();
        Statement statement = null;
        ResultSet rs = null;
        try {
            statement = conn.createStatement();
            rs = statement.executeQuery(sql);
            while (rs.next()) {
                art.setArticleid(rs.getInt("articleid"));
                art.setUid(rs.getInt("uid"));
                art.setUname(rs.getString("uname"));
                art.setTitle(rs.getString("title"));
                art.setContent(rs.getString("content"));
                art.setDate(rs.getString("date"));
                art.setView(rs.getInt("view"));
                art.setLike(rs.getInt("like"));
                art.setCollect(rs.getInt("collect"));
                art.setCover(rs.getString("cover"));
                articles.add(new Article(art));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return articles;
    }

    @Override
    public boolean deleteArticle(Connection conn, int articleid) {
        String sql = "DELETE FROM article WHERE articleid=" + articleid;
        Statement statement = null;
        int rs;
        try {
            statement = conn.createStatement();
            rs = statement.executeUpdate(sql);
            return rs != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }
}
