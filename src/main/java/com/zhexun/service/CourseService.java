package com.zhexun.service;

import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;

import java.util.List;

public interface CourseService {
    boolean postCourse(Course course);
    List<Course> getAllCourse();
    boolean deleteCourse(int Courseid);
}
