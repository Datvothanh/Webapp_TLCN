package com.example.webapp_tlcn.filters;


import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(filterName = "ProductPaidFilter")
public class ProductPaidFilter implements Filter {
    public void init(FilterConfig config) {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        Product product = (Product) session.getAttribute("Product");
        if(product != null){
            int sell  = product.getSell();
            if(sell == 1 ){
                session.setAttribute("retUrl" , request.getRequestURI());
                ServletUtils.redirect("/Home" , request , (HttpServletResponse) res);
                session.setAttribute("Product", new Product());
                return;
            }
        }
        chain.doFilter(req, res);
    }
}
