package com.zhexun.entity;

public class Picture {
    private int pictureid;
    private int uid;
    private String uname;
    private String pname;
    private String date;

    public Picture() {
    }

    public Picture(int pictureid, int uid, String uname, String pname, String date) {
        this.pictureid = pictureid;
        this.uid = uid;
        this.uname = uname;
        this.pname = pname;
        this.date = date;
    }

    public Picture(Picture picture) {
        this.pictureid = picture.getPictureid();
        this.uid = picture.getUid();
        this.uname = picture.getUname();
        this.pname = picture.getPname();
        this.date = picture.getDate();
    }

    public int getPictureid() {
        return pictureid;
    }

    public void setPictureid(int pictureid) {
        this.pictureid = pictureid;
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

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getInsertCondition() {
        StringBuilder sb1 = new StringBuilder();
        StringBuilder sb = new StringBuilder();
//        if (pictureid != 0) {
//            sb1.append("pictureid, ");
//            sb.append(pictureid).append(", ");
//        }
        if (uid != 0) {
            sb1.append("uid, ");
            sb.append(uid).append(", ");
        }
        if (uname != null && !uname.equals("")) {
            sb1.append("uname, ");
            sb.append("'").append(uname).append("', ");
        }
        if (pname != null && !pname.equals("")) {
            sb1.append("pname");
            sb.append("'").append(pname).append("'");
        }
//        if (date != null && !date.equals("")) {
//            sb1.append("date");
//            sb.append("'").append(date).append("'");
//        }
        sb1.append(") VALUES(").append(sb);
        return sb1.toString();
    }
}
