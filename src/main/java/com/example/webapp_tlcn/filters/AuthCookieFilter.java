package com.example.webapp_tlcn.filters;

import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.models.UserModel;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthCookieFilter")
public class AuthCookieFilter implements Filter {
    public void init(FilterConfig config) {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        Cookie arr[] = request.getCookies();
        for (Cookie o :arr){
            if(o.getName().equals("_userid")){
                int id = Integer.parseInt(o.getValue());
                User user = UserModel.findByUserId(id);
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
            }
        }
        chain.doFilter(req, res);
    }
}
