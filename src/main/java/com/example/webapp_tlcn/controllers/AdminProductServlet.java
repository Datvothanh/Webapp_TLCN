package com.example.webapp_tlcn.controllers;

import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
@WebServlet(name = "AdminProductServlet", value = "/Admin/Product/*")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.findAll(0);
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
                break;
            case "/Add":
                List<Category> listCategory = CategoryModel.findAll();
                Product ProEnd = ProductModel.ProEnd();
                int idProEnd;
                if(ProEnd == null){
                    idProEnd = 0;
                }else
                    idProEnd = ProEnd.getProID();
                request.setAttribute("categories", listCategory);
                request.setAttribute("idProEnd", idProEnd);
                ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
                break;
            case "/AddOfSeller":
                List<Category> listCategory0 = CategoryModel.findAll();
                Product ProEnd1 = ProductModel.ProEnd();
                int idProEnd1;
                if(ProEnd1 == null){
                    idProEnd1 = 0;
                }else
                    idProEnd1 = ProEnd1.getProID();
                request.setAttribute("categories", listCategory0);
                request.setAttribute("idProEnd", idProEnd1);
                ServletUtils.forward("/views/vwProduct/AddOfSeller.jsp", request, response);
                break;
            case "/Edit":
                List<Category> listCategory1 = CategoryModel.findAll();
                request.setAttribute("categories", listCategory1);
                int id = Integer.parseInt(request.getParameter("id"));
                Product p = ProductModel.findById(id);
                if (p != null) {
                    request.setAttribute("product", p);
                    ServletUtils.forward("/views/vwProduct/Edit.jsp", request, response);
                } else {
//                    ServletUtils.redirect("Admin/Product/" , request , response);//Đưa về lại trang mà mình muốn
                    ServletUtils.forward("/views/204.jsp", request, response);
                }
                break;
            case "/End":
                List<User> ListUser = UserModel.findAll();
                List<Product> ListAllSucces = ProductModel.findAll(1);
                List<Auction> ListAuction = AuctionModel.findAll();
                List<FeedBack> ListFeedBack = FeedBackModel.findAll();
                List<Notice> listNotices = NoticeModel.findAll();
                request.setAttribute("listNotices", listNotices);
                request.setAttribute("listUsers", ListUser);
                request.setAttribute("feedBackAll", ListFeedBack);
                request.setAttribute("productAll", ListAllSucces);
                request.setAttribute("listAuction", ListAuction);
                ServletUtils.forward("/views/vwProduct/End.jsp", request, response);
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
            case "/Add":
                addProduct(request, response);
                break;
            case "/AddOfSeller":
                addProductOfSeller(request, response);
                break;
            case "/Delete":
                deleteProduct(request, response);
                break;
            case "/Update":
                updateProduct(request, response);
                break;
            case "/End":
                updateShip(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void addProductOfSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("ProName");
        String proID = request.getParameter("ProID");
        int ProID = Integer.parseInt(proID);
        int userSellID = Integer.parseInt(request.getParameter("UserSellID"));
        int startingPrice = Integer.parseInt(request.getParameter("StartingPrice"));
        User U = UserModel.findByUserId(userSellID);
        assert U != null;
        User u = new User(U.getId() , U.getMoney() - startingPrice * 20/100  , U.getMoneyAu());
        UserModel.updateMoney(u);
        int stepPrice = Integer.parseInt(request.getParameter("StepPrice"));
        int type = Integer.parseInt(request.getParameter("CatID"));
        int highestPaidPrice = 0;
        int sell = 0;
        int userID = -1;
        int countAuction = 0;
        String tinyDes = request.getParameter("TinyDes");
        String fullDes = request.getParameter("FullDes");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        LocalDateTime endDay = LocalDateTime.parse(strED, df);
        int day = endDay.getDayOfMonth();
        int month = endDay.getMonthValue();
        int year = endDay.getYear();
        int hour = endDay.getHour();
        int minute = endDay.getMinute();
        int second = endDay.getSecond();
        Product p = new Product(ProID , startingPrice , type , stepPrice, highestPaidPrice , userID , sell ,countAuction,userSellID,name , tinyDes, fullDes, endDay , startingPrice , 0 , year , month , day , hour , minute , second , 0 , 0);
        ProductModel.add(p);
        Part partMain = request.getPart("ImageMain");
        Part partSub1 = request.getPart("ImageSub1");
        Part partSub2 = request.getPart("ImageSub2");
        Part partSub3 = request.getPart("ImageSub3");
        String realpath = "/public/imgs/sp/";
        String realPathAll = realpath.concat(proID);
        String realPath = this.getServletContext().getRealPath(realPathAll);
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        partMain.write(realPath + "/" + "main.jpg");
        partSub1.write(realPath + "/" + "sub1.jpg");
        partSub2.write(realPath + "/" + "sub2.jpg");
        partSub3.write(realPath + "/" + "sub3.jpg");
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updateShip(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idPro = Integer.parseInt(request.getParameter("idPro"));
        int ship = Integer.parseInt(request.getParameter("ship"));
        Product product = new Product(idPro , ship);
        ProductModel.updateShip(product);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("ProName");
        String proID = request.getParameter("ProID");
        int ProID = Integer.parseInt(proID);
        int userSellID = Integer.parseInt(request.getParameter("UserSellID"));
        int startingPrice = Integer.parseInt(request.getParameter("StartingPrice"));
        int stepPrice = Integer.parseInt(request.getParameter("StepPrice"));
        int type = Integer.parseInt(request.getParameter("CatID"));
        int highestPaidPrice = 0;
        int sell = 0;
        int userID = -1;
        int countAuction = 0;
        String tinyDes = request.getParameter("TinyDes");
        String fullDes = request.getParameter("FullDes");
        String strED = request.getParameter("EndDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        LocalDateTime endDay = LocalDateTime.parse(strED, df);
        int day = endDay.getDayOfMonth();
        int month = endDay.getMonthValue();
        int year = endDay.getYear();
        int hour = endDay.getHour();
        int minute = endDay.getMinute();
        int second = endDay.getSecond();
        Product p = new Product(ProID ,startingPrice , type , stepPrice, highestPaidPrice , userID , sell ,countAuction,userSellID,name , tinyDes, fullDes, endDay , startingPrice , 0, year , month , day , hour , minute , second , 0 , 0);
        ProductModel.add(p);
        Part partMain = request.getPart("ImageMain");
        Part partSub1 = request.getPart("ImageSub1");
        Part partSub2 = request.getPart("ImageSub2");
        Part partSub3 = request.getPart("ImageSub3");
        String realpath = "/public/imgs/sp/";
        String realPathAll = realpath.concat(proID);
        String realPath = this.getServletContext().getRealPath(realPathAll);
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        partMain.write(realPath + "/" + "main.jpg");
        partSub1.write(realPath + "/" + "sub1.jpg");
        partSub2.write(realPath + "/" + "sub2.jpg");
        partSub3.write(realPath + "/" + "sub3.jpg");
        ServletUtils.redirect("/Admin/Product", request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type = Integer.parseInt(request.getParameter("CatID"));
        int startingPrice = Integer.parseInt(request.getParameter("StartingPrice"));
        int stepPrice = Integer.parseInt(request.getParameter("StepPrice"));
        int id = Integer.parseInt(request.getParameter("ProID"));
        Product p = ProductModel.findById(id);
        assert p != null;
        int highestPaidPrice = p.getHighestPaidPrice();
        int top;
        top = startingPrice;
        String name = request.getParameter("ProName");
        String tinyDes = request.getParameter("TinyDes");
        String fullDes = request.getParameter("FullDes");
        String strED = request.getParameter("EndDay");
        if(Objects.equals(strED, "____/__/__ __:__")){
            LocalDateTime endDay = p.getEndDay();
            int day = endDay.getDayOfMonth();
            int month = endDay.getMonthValue();
            int year = endDay.getYear();
            int hour = endDay.getHour();
            int minute = endDay.getMinute();
            int second = endDay.getSecond();
            Product P = new Product(id,startingPrice , type , stepPrice, highestPaidPrice , name , tinyDes, fullDes, endDay , top , year , month , day , hour , minute , second ,0 , 0);
            ProductModel.update(P);
        }else {
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
            LocalDateTime endDay = LocalDateTime.parse(strED, df);
            int day = endDay.getDayOfMonth();
            int month = endDay.getMonthValue();
            int year = endDay.getYear();
            int hour = endDay.getHour();
            int minute = endDay.getMinute();
            int second = endDay.getSecond();
            Product P = new Product(id,startingPrice , type , stepPrice, highestPaidPrice , name , tinyDes, fullDes, endDay , top , year , month , day , hour , minute , second , 0 , 0);
            ProductModel.update(P);
        }

        ServletUtils.redirect("/Admin/Product", request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ProID"));
        Product p = ProductModel.findById(id);
        assert p != null;
        Product P = new Product(id, p.getStartingPrice(), p.getCatID() , p.getStepPrice(), p.getHighestPaidPrice(), p.getProName() ,p.getTinyDes(), p.getFullDes(), p.getEndDay() , p.getTop() , p.getYear() , p.getMonth() , p.getDay() , p.getDay() , p.getMinute() , p.getSecond() , 1 , 0);
        ProductModel.update(P);
        ServletUtils.redirect("/Admin/Product", request, response);
    }
}