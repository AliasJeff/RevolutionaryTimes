package com.zhexun.servlet;

import com.zhexun.entity.User;
import com.zhexun.service.UserService;
import com.zhexun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateUserInfo", urlPatterns = "/updateUserInfo")
public class UpdateUserInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        User user = new User();
        String curUser = (String) req.getSession().getAttribute("username");
        UserService userService = new UserServiceImpl();
        if (req.getParameter("newAvatar") != null)
            user.setAvatar(req.getParameter("newAvatar"));
        if (req.getParameter("newUsername") != null)
            user.setUname(req.getParameter("newUsername"));
        if (req.getParameter("newUpassword") != null)
            user.setUpassword(req.getParameter("newUpassword"));
        if (req.getParameter("newUintroduce") != null)
            user.setUintroduce(req.getParameter("newUintroduce"));
        if (req.getParameter("newEmail") != null)
            user.setEmail(req.getParameter("newEmail"));
        if (req.getParameter("newBirthday") != null)
            user.setBirthday(req.getParameter("newBirthday"));

        if (userService.updateUser(curUser, user)) {  // 更新成功
            User newUser;
            newUser = userService.getUserByCondition(user);
            req.getSession().setAttribute("username", newUser.getUname());
            req.getRequestDispatcher( "/reloadUserInfo").forward(req,resp);
        } else {
            req.setAttribute("msg", "编辑个人信息失败！");
            req.getRequestDispatcher( "/reloadUserInfo").forward(req,resp);
        }
    }
}
