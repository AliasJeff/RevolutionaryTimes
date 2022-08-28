package com.zhexun.service.impl;

import com.zhexun.dao.CourseDao;
import com.zhexun.dao.impl.CourseDaoImpl;
import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;
import com.zhexun.service.CourseService;
import com.zhexun.util.JDBCUtil;

import java.sql.Connection;
import java.util.List;

public class CourseServiceImpl implements CourseService {
    CourseDao courseDao = new CourseDaoImpl();

    @Override
    public boolean postCourse(Course course) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = courseDao.postCourse(conn, course);
        JDBCUtil.release(conn);
        return success;
    }

    @Override
    public List<Course> getAllCourse() {
        Connection conn = JDBCUtil.getConnection();
        List<Course> courses;
        courses = courseDao.getAllCourse(conn);
        JDBCUtil.release(conn);
        return courses;
    }

    @Override
    public boolean deleteCourse(int Courseid) {
        Connection conn = JDBCUtil.getConnection();
        boolean success;
        success = courseDao.deleteCourse(conn, Courseid);
        JDBCUtil.release(conn);
        return success;
    }
}
