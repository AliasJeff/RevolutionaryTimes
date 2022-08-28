package com.zhexun.dao;

import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;

import java.sql.Connection;
import java.util.List;

public interface CommentDao {
    List<Comment> getCommentsByArticle(Connection conn, Article article);
    boolean issueComment(Connection conn, Comment comment);
    List<Comment> getAllComments(Connection conn);
    boolean deleteComment(Connection conn, int commentid);
}
