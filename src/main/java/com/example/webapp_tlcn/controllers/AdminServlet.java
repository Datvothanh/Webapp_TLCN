package com.example.webapp_tlcn.controllers;
import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "AdminServlet", value = "/Admin/*")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Product";
        }

        switch (path) {
            case "/Product":
                List<Product> list = ProductModel.findAll(0);
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
                break;
            case "/Statistical":
                List<Product> ListAllSucces = ProductModel.findAll(1);
                List<Auction> ListAuction = AuctionModel.findAll();
                List<Notice> listNotices = NoticeModel.findAll();
                request.setAttribute("listNotices", listNotices);
                request.setAttribute("productAll", ListAllSucces);
                request.setAttribute("listAuction", ListAuction);
                List<GroupCategory> listGroupCategory = GroupCategoryModel.findAll();
                request.setAttribute("listGrCat", listGroupCategory);
                List<Product> listProduct1 = ProductModel.findAll(1);
                request.setAttribute("listPro1", listProduct1);
                List<Product> listProduct = ProductModel.findAll(0);
                request.setAttribute("listPro0", listProduct);
                List<User> listUser = UserModel.findAll();
                request.setAttribute("listUser", listUser);
                ServletUtils.forward("/views/vwHome/Statistical.jsp", request, response);
                break;
            case "/User":
                ServletUtils.forward("/views/vwAccount/About.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
