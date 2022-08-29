package com.zhexun.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        // 对登陆相关的资源放行
        String[] urls = {"/login.jsp", "/css/", "/font/", "/image/", "/js/", "/layui/", "/login", "/register"};
        String url = req.getRequestURL().toString();
        for (String u : urls) {
            if(url.contains(u)) {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }

        Object username = req.getSession().getAttribute("username");
        if(username != null) {  // 已登录，放行
            filterChain.doFilter(servletRequest, servletResponse);
        } else {    // 未登录，弹出错误提示信息，转发到登录页面
            req.setAttribute("msg", "您尚未登陆，请先登录！");
            req.getRequestDispatcher("/login.jsp").forward(req, servletResponse);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
