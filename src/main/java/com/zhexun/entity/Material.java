package com.zhexun.entity;

import java.util.Date;

public class Material {
    private int materialid;
    private int uid;
    private Date date;
    private String content;

    public Material() {
    }

    public Material(int materialid, int uid, Date date, String content) {
        this.materialid = materialid;
        this.uid = uid;
        this.date = date;
        this.content = content;
    }

    public int getMaterialid() {
        return materialid;
    }

    public void setMaterialid(int materialid) {
        this.materialid = materialid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
