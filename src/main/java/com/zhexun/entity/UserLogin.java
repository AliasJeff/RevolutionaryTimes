package com.zhexun.entity;

public class UserLogin {

    static private int uid;
    static private String uname;
    static private String upassword;

    public UserLogin() {
    }

    public UserLogin(int uid, String uname, String upassword) {
        this.uid = uid;
        this.uname = uname;
        this.upassword = upassword;
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

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                '}';
    }

    public String getQueryCondition() {
        StringBuilder stringBuilder = new StringBuilder("1=1");
        if (uid != 0) {
            stringBuilder.append(" and uid=").append(uid);
        }
        if (uname != null) {
            stringBuilder.append(" and uname= '").append(uname).append("'");
        }

        if (upassword != null) {
            stringBuilder.append(" and upassword= '").append(upassword).append("'");
        }

        return stringBuilder.toString();
    }
}
