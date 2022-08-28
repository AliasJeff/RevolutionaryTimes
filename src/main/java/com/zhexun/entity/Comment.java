package com.zhexun.entity;

import java.util.Date;

public class Comment {
    private int commentid;
    private int articleid;
    private String articleTitle;
    private int uid;
    private String uname;
    private int uoid;
    private String uoname;
    private String commentContent;
    private String date;

    public Comment() {
    }

    public Comment(int commentid, int articleid, String articleTitle, int uid, String uname, int uoid, String uoname, String commentContent, String date) {
        this.commentid = commentid;
        this.articleid = articleid;
        this.articleTitle = articleTitle;
        this.uid = uid;
        this.uname = uname;
        this.uoid = uoid;
        this.uoname = uoname;
        this.commentContent = commentContent;
        this.date = date;
    }

    public Comment(Comment comment) {
        this.commentid = comment.getCommentid();
        this.articleid = comment.getArticleid();
        this.articleTitle = comment.getArticleTitle();
        this.uid = comment.getUid();
        this.uname = comment.getUname();
        this.uoid = comment.getUoid();
        this.uoname = comment.getUoname();
        this.commentContent = comment.getCommentContent();
        this.date = comment.getDate();
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public int getArticleid() {
        return articleid;
    }

    public void setArticleid(int articleid) {
        this.articleid = articleid;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getUoid() {
        return uoid;
    }

    public void setUoid(int uoid) {
        this.uoid = uoid;
    }

    public String getUoname() {
        return uoname;
    }

    public void setUoname(String uoname) {
        this.uoname = uoname;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUpdateCondition() {
        StringBuilder sb1 = new StringBuilder();
        StringBuilder sb = new StringBuilder();
        if (articleid != 0) {
            sb1.append("articleid, ");
            sb.append(articleid).append(", ");
        }
        if (articleTitle != null && !articleTitle.equals("")) {
            sb1.append("articletitle, ");
            sb.append("'").append(articleTitle).append("', ");
        }
        if (uid != 0) {
            sb1.append("uid, ");
            sb.append(uid).append(", ");
        }
        if (uname != null && !uname.equals("")) {
            sb1.append("uname, ");
            sb.append("'").append(uname).append("', ");
        }
        if (uoid != 0) {
            sb1.append("uoid, ");
            sb.append(uoid).append(", ");
        }
        if (uoname != null && !uoname.equals("")) {
            sb1.append("uoname, ");
            sb.append("'").append(uoname).append("', ");
        }
        if (commentContent != null && !commentContent.equals("")) {
            sb1.append("commentContent, ");
            sb.append("'").append(commentContent).append("', ");
        }
        if (date != null && !date.equals("")) {
            sb1.append("date");
            sb.append("'").append(date).append("'");
        }
        sb1.append(") VALUES(").append(sb);
        return sb1.toString();
    }
}
