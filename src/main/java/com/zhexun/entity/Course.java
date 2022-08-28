package com.zhexun.entity;

public class Course {
    private int courseid;
    private String cname;
    private int uid;
    private String uname;
    private String date;

    public Course() {
    }

    public Course(Course course) {
        this.courseid = course.getCourseid();
        this.cname = course.getCname();
        this.uid = course.getUid();
        this.uname = course.getUname();
        this.date = course.getDate();
    }

    public Course(int courseid, String cname, int uid, String uname, String date) {
        this.courseid = courseid;
        this.cname = cname;
        this.uid = uid;
        this.uname = uname;
        this.date = date;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getInsertCondition() {
        StringBuilder sb1 = new StringBuilder();
        StringBuilder sb = new StringBuilder();
//        if (courseid != 0) {
//            sb1.append("courseid, ");
//            sb.append(courseid).append(", ");
//        }
        if (uid != 0) {
            sb1.append("uid, ");
            sb.append(uid).append(", ");
        }
        if (cname != null && !cname.equals("")) {
            sb1.append("cname, ");
            sb.append("'").append(cname).append("', ");
        }
        if (uname != null && !uname.equals("")) {
            sb1.append("uname");
            sb.append("'").append(uname).append("'");
        }
//        if (date != null && !date.equals("")) {
//            sb1.append("date");
//            sb.append("'").append(date).append("'");
//        }
        sb1.append(") VALUES(").append(sb);
        return sb1.toString();
    }
}
