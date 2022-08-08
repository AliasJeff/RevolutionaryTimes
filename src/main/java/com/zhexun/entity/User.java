package com.zhexun.entity;

public class User {
    private int uid;
    private String uname;
    private String upassword;
    private String uintroduce;
    private String avatar;
    private String email;
    private String birthday;
    private int access;

    public User() {
    }

    public User(int uid, String uname, String upassword, String uintroduce, String avatar, String email, String birthday, int access) {
        this.uid = uid;
        this.uname = uname;
        this.upassword = upassword;
        this.uintroduce = uintroduce;
        this.avatar = avatar;
        this.email = email;
        this.birthday = birthday;
        this.access = access;
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

    public String getUintroduce() {
        return uintroduce;
    }

    public void setUintroduce(String uintroduce) {
        this.uintroduce = uintroduce;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getAccess() {
        return access;
    }

    public void setAccess(int access) {
        this.access = access;
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
