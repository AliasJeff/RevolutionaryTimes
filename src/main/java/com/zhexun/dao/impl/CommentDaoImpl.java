package com.zhexun.dao.impl;

import com.zhexun.dao.CommentDao;
import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl implements CommentDao {
    @Override
    public List<Comment> getCommentsByArticle(Connection conn, Article article) {
        int id = 100;
        int count = 100;
        Comment com = new Comment();
        List<Comment> comments = new ArrayList<>();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM comment WHERE articleid=" + article.getArticleid() + " and commentid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    com.setArticleid(rs.getInt("articleid"));
                    com.setArticleTitle(rs.getString("articletitle"));
                    com.setCommentid(rs.getInt("commentid"));
                    com.setUid(rs.getInt("uid"));
                    com.setUoid(rs.getInt("uoid"));
                    com.setUname(rs.getString("uname"));
                    com.setUoname(rs.getString("uoname"));
                    com.setCommentContent(rs.getString("commentcontent"));
                    com.setDate(rs.getString("date"));
                    comments.add(new Comment(com));
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
        return comments;
    }

    @Override
    public boolean issueComment(Connection conn, Comment comment) {
        String sql = "INSERT INTO comment(" + comment.getUpdateCondition() + ")";
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
    public List<Comment> getAllComments(Connection conn) {
        int id = 100;
        int count = 100;
        Comment com = new Comment();
        List<Comment> comments = new ArrayList<>();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM comment WHERE commentid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    com.setArticleid(rs.getInt("articleid"));
                    com.setArticleTitle(rs.getString("articletitle"));
                    com.setCommentid(rs.getInt("commentid"));
                    com.setUid(rs.getInt("uid"));
                    com.setUoid(rs.getInt("uoid"));
                    com.setUname(rs.getString("uname"));
                    com.setUoname(rs.getString("uoname"));
                    com.setCommentContent(rs.getString("commentcontent"));
                    com.setDate(rs.getString("date"));
                    comments.add(new Comment(com));
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
        return comments;
    }

    @Override
    public boolean deleteComment(Connection conn, int commentid) {
        String sql = "DELETE FROM comment WHERE commentid=" + commentid;
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
