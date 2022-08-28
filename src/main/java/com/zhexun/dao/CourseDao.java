package com.zhexun.dao;

import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;
import com.zhexun.service.CourseService;

import java.sql.Connection;
import java.util.List;

public interface CourseDao {
    boolean postCourse(Connection conn, Course course);
    List<Course> getAllCourse(Connection conn);
    boolean deleteCourse(Connection conn, int courseid);
}
