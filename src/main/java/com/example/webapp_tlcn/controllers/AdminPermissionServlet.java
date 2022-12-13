package com.example.webapp_tlcn.controllers;

import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.models.UserModel;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminPermissionServlet", value = "/Admin/Permission/*")
public class AdminPermissionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                List<User> userList = UserModel.findAll();
                request.setAttribute("userList" , userList);
                ServletUtils.forward("/views/vwAccount/Permission.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/AddMoney":
                AddMoney(request,response);
              break;
            case "/MinusMoney":
                MinusMoney(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }

    private void MinusMoney(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int Money =  Integer.parseInt(request.getParameter("money"));
        int id =  Integer.parseInt(request.getParameter("id"));
        User u = UserModel.findByUserId(id);
        assert u != null;
        int money = u.getMoney() - Money;
        User User = new User(u.getId() , u.getPermission() , u.getCode() , u.getUsername() ,u.getPassword() , u.getName() , u.getEmail() , u.getDob() , money , u.getMoneyAu() , u.getAddress() , u.getPhone() );
        UserModel.update(User);
        String url = "/Admin/Permission/Index";
        ServletUtils.redirect(url, request, response);
    }

    private void AddMoney(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int Money =  Integer.parseInt(request.getParameter("money"));
        int id =  Integer.parseInt(request.getParameter("id"));
        User u = UserModel.findByUserId(id);
        assert u != null;
        int money = u.getMoney() + Money;
        User User = new User(u.getId() , u.getPermission() , u.getCode() , u.getUsername() ,u.getPassword() , u.getName() , u.getEmail() , u.getDob() , money , u.getMoneyAu() , u.getAddress() , u.getPhone() );
        UserModel.update(User);
        String url = "/Admin/Permission/Index";
        ServletUtils.redirect(url, request, response);
    }


}
