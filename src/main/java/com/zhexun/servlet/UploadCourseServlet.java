package com.zhexun.servlet;

import com.zhexun.entity.Course;
import com.zhexun.entity.Picture;
import com.zhexun.entity.User;
import com.zhexun.service.CourseService;
import com.zhexun.service.PictureService;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.CourseServiceImpl;
import com.zhexun.service.impl.PictureServiceImpl;
import com.zhexun.service.impl.UserServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "uploadCourseServlet", urlPatterns = "/uploadCourse")
public class UploadCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        FileItemFactory factory = new DiskFileItemFactory();

        // 创建文件上传处理器
        ServletFileUpload upload = new ServletFileUpload(factory);

        // 开始解析请求信息
        List items = null;
        try {
            items = upload.parseRequest(req);
        }
        catch (FileUploadException e) {
            e.printStackTrace();
        }

        // 对所有请求信息进行判断
        Iterator iter = items.iterator();
        while (iter.hasNext()) {
            boolean success = false;
            FileItem item = (FileItem) iter.next();
            // 信息为普通的格式
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String value = item.getString();
                req.setAttribute(fieldName, value);
            }
            // 信息为文件格式
            else {
                String fileName = item.getName();
//                System.out.println(fileName);
                int index = fileName.lastIndexOf("\\");
                fileName = fileName.substring(index + 1);
                req.setAttribute("realFileName", fileName);

//                String basePath = req.getRealPath("/images");
                String basePath = this.getServletContext().getRealPath("/courses");
                File file = new File(basePath, fileName);
                try {
                    item.write(file);
                    Course course = new Course();
                    User user = new User();
                    CourseService courseService = new CourseServiceImpl();
                    UserService userService = new UserServiceImpl();

                    user.setUname((String) req.getSession().getAttribute("username"));
                    user = userService.getUserByCondition(user);
                    course.setUid(user.getUid());
                    course.setUname(user.getUname());
                    course.setCname(fileName);
//                    picture.setDate((String) req.getParameter("date1"));    // TODO: date获取不到
                    success = courseService.postCourse(course);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }

            String preUrl = (String) req.getSession().getAttribute("preUrl");
            if(Objects.equals(preUrl, "http://localhost:9999/indexForward.jsp"))
                preUrl = "index.jsp";
            if (success) {
                req.setAttribute("msg","文件上传成功!");
//                getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
                resp.sendRedirect(preUrl);
            } else {
                req.setAttribute("msg","文件上传失败!");
                req.getRequestDispatcher("/postCourse.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
