package com.example.webapp_tlcn.filters;

import com.example.webapp_tlcn.beans.Category;
import com.example.webapp_tlcn.beans.GroupCategory;
import com.example.webapp_tlcn.models.CategoryModel;
import com.example.webapp_tlcn.models.GroupCategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter" )
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        List<Category> Category = CategoryModel.findAll();
        request.setAttribute("categoriesWithDetails" , Category);
        List<GroupCategory> GroupCategory = GroupCategoryModel.findAll();
        request.setAttribute("groupCategoriesWithDetails" , GroupCategory);
        chain.doFilter(request, response);
    }
}

