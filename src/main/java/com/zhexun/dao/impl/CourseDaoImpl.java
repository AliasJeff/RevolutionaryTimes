package com.zhexun.dao.impl;

import com.zhexun.dao.CourseDao;
import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CourseDaoImpl implements CourseDao {
    @Override
    public boolean postCourse(Connection conn, Course course) {
        String sql = "INSERT INTO course(" + course.getInsertCondition() + ")";
        Statement st = null;
        int i = 0;
        try {
            st = conn.createStatement();
            i = st.executeUpdate(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                st.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return i != 0;
    }

    @Override
    public List<Course> getAllCourse(Connection conn) {
        int id = 100;
        int count = 100;
        Course course = new Course();
        List<Course> courses = new ArrayList<>();
        Statement statement = null;
        ResultSet rs = null;
        try {
            while(count > 0 && id > 0) {
                String sql = "SELECT * FROM course WHERE courseid=" + id;
                statement = conn.createStatement();
                rs = statement.executeQuery(sql);
                if(rs.next()) {
                    course.setCourseid(rs.getInt("courseid"));
                    course.setUid(rs.getInt("uid"));
                    course.setUname(rs.getString("uname"));
                    course.setCname(rs.getString("cname"));
                    course.setDate(rs.getString("date"));
                    courses.add(new Course(course));
                    count--;
                }
                id--;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return courses;
    }

    @Override
    public boolean deleteCourse(Connection conn, int courseid) {
        String sql = "DELETE FROM course WHERE courseid=" + courseid;
        Statement statement = null;
        int rs;
        try {
            statement = conn.createStatement();
            rs = statement.executeUpdate(sql);
            return rs != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return false;
    }
}
