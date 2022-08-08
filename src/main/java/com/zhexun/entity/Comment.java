package com.zhexun.entity;

import java.util.Date;

public class Comment {
    private int commentid;
    private int courseid;
    private int uid;
    private int uoid;
    private String commentContent;
    private Date date;

    public Comment() {
    }

    public Comment(int commentid, int courseid, int uid, int uoid, String commentContent, Date date) {
        this.commentid = commentid;
        this.courseid = courseid;
        this.uid = uid;
        this.uoid = uoid;
        this.commentContent = commentContent;
        this.date = date;
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getUoid() {
        return uoid;
    }

    public void setUoid(int uoid) {
        this.uoid = uoid;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}