package com.zhexun.service;

import com.zhexun.entity.Article;
import com.zhexun.entity.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> getComments(Article article);
    boolean issueComment(Comment comment);
    List<Comment> getAllComments();
    boolean deleteComment(int commentid);
}
