package com.zhexun.entity;

public class User {
    private int uid;
    private String uname;
    private String upassword;
    private String uintroduce;
    private String avatar;
    private String email;
    private String birthday;
    private int collectArticleid;
    private String access;

    public User() {
    }

    public User(int uid, String uname, String upassword, String uintroduce, String avatar, String email, String birthday, int collectArticleid, String access) {
        this.uid = uid;
        this.uname = uname;
        this.upassword = upassword;
        this.uintroduce = uintroduce;
        this.avatar = avatar;
        this.email = email;
        this.birthday = birthday;
        this.collectArticleid = collectArticleid;
        this.access = access;
    }

    public User(User user) {
        this.uid = user.getUid();
        this.uname = user.getUname();
        this.upassword = user.getUpassword();
        this.uintroduce = user.getUintroduce();
        this.avatar = user.getAvatar();
        this.email = user.getEmail();
        this.birthday = user.getBirthday();
        this.access = user.getAccess();
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

    public int getCollectArticleid() {
        return collectArticleid;
    }

    public void setCollectArticleid(int collectArticleid) {
        this.collectArticleid = collectArticleid;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public String myToString() {
        return "User{" +
                "avatar='" + avatar + '\'' +
                ", uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", uintroduce='" + uintroduce + '\'' +
                ", email='" + email + '\'' +
                ", birthday='" + birthday + '\'' +
                '}';
    }

    public String getQueryCondition() {
        StringBuilder stringBuilder = new StringBuilder("1=1");
        if (avatar != null && !avatar.isEmpty()) {
            stringBuilder.append(" and avatar= '").append(uid).append("'");
        }
        if (uid != 0) {
            stringBuilder.append(" and uid=").append(uid);
        }
        if (uname != null && !uname.isEmpty()) {
            stringBuilder.append(" and uname= '").append(uname).append("'");
        }
        if (upassword != null && !upassword.isEmpty()) {
            stringBuilder.append(" and upassword= '").append(upassword).append("'");
        }
        if (uintroduce != null && !uintroduce.isEmpty()) {
            stringBuilder.append(" and uintroduce= '").append(uintroduce).append("'");
        }
        if (email != null && !email.isEmpty()) {
            stringBuilder.append(" and email= '").append(email).append("'");
        }
        if (birthday != null && !birthday.isEmpty()) {
            stringBuilder.append(" and birthday= '").append(birthday).append("'");
        }

        return stringBuilder.toString();
    }

    public String getUpdateQuery() {
        StringBuilder sb = new StringBuilder();
        if (avatar != null && !avatar.equals("")) {
            if(sb.isEmpty())
                sb.append("avatar= '").append(avatar).append("'");
            else
                sb.append(" and avatar= '").append(avatar).append("'");
        }
        if (uid != 0) {
            if(sb.isEmpty())
                sb.append("uid=").append(uid);
            else
                sb.append(" and uid=").append(uid);
        }
        if (uname != null && !uname.equals("")) {
            if(sb.isEmpty())
                sb.append("uname= '").append(uname).append("'");
            else
                sb.append(" and uname= '").append(uname).append("'");
        }
        if (upassword != null && !upassword.equals("")) {
            if(sb.isEmpty())
                sb.append("upassword= '").append(upassword).append("'");
            else
                sb.append(" and upassword= '").append(upassword).append("'");
        }
        if (uintroduce != null && !uintroduce.equals("")) {
            if(sb.isEmpty())
                sb.append("uintroduce= '").append(uintroduce).append("'");
            else
                sb.append(" and uintroduce= '").append(uintroduce).append("'");
        }
        if (email != null && !email.equals("")) {
            if(sb.isEmpty())
                sb.append("email= '").append(email).append("'");
            else
                sb.append(" and email= '").append(email).append("'");
        }
        if (birthday != null && !birthday.equals("")) {
            if(sb.isEmpty())
                sb.append("birthday= '").append(birthday).append("'");
            else
                sb.append(" and birthday= '").append(birthday).append("'");
        }
        return sb.toString();
    }
}
