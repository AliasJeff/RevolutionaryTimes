package com.zhexun.entity;

public class opCourse {
    private int courseid;
    private int likeid;
    private int collectionid;
    private int commentuid;

    public opCourse() {
    }

    public opCourse(int courseid, int likeid, int collectionid, int commentuid) {
        this.courseid = courseid;
        this.likeid = likeid;
        this.collectionid = collectionid;
        this.commentuid = commentuid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public int getLikeid() {
        return likeid;
    }

    public void setLikeid(int likeid) {
        this.likeid = likeid;
    }

    public int getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(int collectionid) {
        this.collectionid = collectionid;
    }

    public int getCommentuid() {
        return commentuid;
    }

    public void setCommentuid(int commentuid) {
        this.commentuid = commentuid;
    }
}
