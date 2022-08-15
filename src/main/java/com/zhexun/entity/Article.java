package com.zhexun.entity;

import java.util.Date;

public class Article {
    private int articleid;
    private int uid;
    private String uname;
    private int view;
    private int like;
    private int collect;
    private String title;
    private String content;
    private String date;
    private String cover;

    public Article() {
    }

    public Article(int articleid, int uid, String uname, int view, int like, int collect, String title, String content, String date, String cover) {
        this.articleid = articleid;
        this.uid = uid;
        this.uname = uname;
        this.view = view;
        this.like = like;
        this.collect = collect;
        this.title = title;
        this.content = content;
        this.date = date;
        this.cover = cover;
    }

    public Article(Article art) {
        this.articleid = art.getArticleid();
        this.uid = art.getUid();
        this.uname = art.getUname();
        this.view = art.getView();
        this.like = art.getLike();
        this.collect = art.getCollect();
        this.title = art.getTitle();
        this.content = art.getContent();
        this.date = art.getDate();
        this.cover = art.getCover();
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

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleid=" + articleid +
                ", uid='" + uid + '\'' +
                ", uname='" + uname + '\'' +
                ", title='" + title + '\'' +
                '}';
    }

    public String getQueryCondition() {
        StringBuilder stringBuilder = new StringBuilder("1=1");
        if (articleid != 0) {
            stringBuilder.append(" and articleid=").append(articleid);
        }
        if (uid != 0) {
            stringBuilder.append(" and uid= '").append(uid).append("'");
        }

        if (uname != null) {
            stringBuilder.append(" and uname= '").append(uname).append("'");
        }

        if (title != null) {
            stringBuilder.append(" and title=").append(title);
        }

        return stringBuilder.toString();
    }
}
