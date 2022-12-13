package com.example.webapp_tlcn.filters;

import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;

@WebFilter(filterName = "LayoutFilter" )
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")==null){
            session.setAttribute("auth" , false);
            session.setAttribute("otp" , false);
            session.setAttribute("authUser" , new User());
        }
        List<Category> Category = CategoryModel.findAll();
        request.setAttribute("categoriesWithDetails" , Category);
        List<GroupCategory> GroupCategory = GroupCategoryModel.findAll();
        request.setAttribute("groupCategoriesWithDetails" , GroupCategory);
        chain.doFilter(req, response);
    }
}

