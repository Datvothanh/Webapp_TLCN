package com.example.webapp_tlcn.filters;

import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(filterName = "AuthAdminFilter")
public class AuthAdminFilter implements Filter {
    public void init(FilterConfig config) {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")==null){
            session.setAttribute("auth" , false);
            session.setAttribute("otp" , false);
            session.setAttribute("authUser" , new User());
        }
        boolean auth = (boolean) session.getAttribute("auth");
        User user = (User) session.getAttribute("authUser");
        int permission = user.getPermission();
        if(permission != 0 || !auth){
            session.setAttribute("retUrl" , request.getRequestURI());
            ServletUtils.redirect("/Account/Login" , request , (HttpServletResponse) res);
            return;
        }
        chain.doFilter(req, res);
    }
}

