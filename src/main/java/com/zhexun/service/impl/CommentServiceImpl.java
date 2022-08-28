package com.zhexun.service.impl;

import com.zhexun.dao.CommentDao;
import com.zhexun.dao.impl.CommentDaoImpl;
import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;
import com.zhexun.service.CommentService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.util.List;

public class CommentServiceImpl implements CommentService {
    CommentDao commentDao = new CommentDaoImpl();
    @Override
    public List<Comment> getComments(Article article) {
        Connection conn = JDBCUtil.getConnection();
        List<Comment> comments;
        comments = commentDao.getCommentsByArticle(conn, article);
        JDBCUtil.release(conn);
        return comments;
    }

    @Override
    public boolean issueComment(Comment comment) {
        Connection conn = JDBCUtil.getConnection();
        boolean flag;
        flag = commentDao.issueComment(conn, comment);
        JDBCUtil.release(conn);
        return flag;
    }

    @Override
    public List<Comment> getAllComments() {
        Connection conn = JDBCUtil.getConnection();
        List<Comment> comments;
        comments = commentDao.getAllComments(conn);
        JDBCUtil.release(conn);
        return comments;
    }

    @Override
    public boolean deleteComment(int commentid) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = commentDao.deleteComment(conn, commentid);
        JDBCUtil.release(conn);
        return success;
    }
}
