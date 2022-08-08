package com.zhexun.entity;

import java.util.Date;

public class Course {
    private int courseid;
    private int uid;
    private int view;
    private int like;
    private int collection;
    private String title;
    private String summary;
    private Date date;
    private String courseContent;

    public Course() {
    }

    public Course(int courseid, int uid, int view, int like, int collection, String title, String summary, Date date, String courseContent) {
        this.courseid = courseid;
        this.uid = uid;
        this.view = view;
        this.like = like;
        this.collection = collection;
        this.title = title;
        this.summary = summary;
        this.date = date;
        this.courseContent = courseContent;
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

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getCollection() {
        return collection;
    }

    public void setCollection(int collection) {
        this.collection = collection;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCourseContent() {
        return courseContent;
    }

    public void setCourseContent(String courseContent) {
        this.courseContent = courseContent;
    }
}
