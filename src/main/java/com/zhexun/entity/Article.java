package com.zhexun.entity;

import java.util.Date;

public class Article {
    private int articleid;
    private int uid;
    private int view;
    private int like;
    private int collect;
    private String title;
    private String content;
    private Date date;

    public Article() {
    }

    public Article(int articleid, int uid, int view, int like, int collect, String title, String content, Date date) {
        this.articleid = articleid;
        this.uid = uid;
        this.view = view;
        this.like = like;
        this.collect = collect;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public Article(Article art) {
        this.articleid = art.getArticleid();
        this.uid = art.getUid();
        this.view = art.getView();
        this.like = art.getLike();
        this.collect = art.getCollect();
        this.title = art.getTitle();
        this.content = art.getContent();
        this.date = art.getDate();
    }

    public int getArticleid() {
        return articleid;
    }

    public void setArticleid(int articleid) {
        this.articleid = articleid;
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

    public int getCollect() {
        return collect;
    }

    public void setCollect(int collect) {
        this.collect = collect;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
