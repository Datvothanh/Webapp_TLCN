package com.example.webapp_tlcn.controllers;

import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import static com.example.webapp_tlcn.tools.tools.maskString;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/404";
        }
        switch (path) {
            case "/ByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatID(catId , 0);
                List<Favourite> listFavourite = FavouriteModel.findAll();
                List<User> User = UserModel.findAll();
                List<Auction> Auction = AuctionModel.findAll();
                Category category = CategoryModel.findById(catId);
                for (com.example.webapp_tlcn.beans.User value : User) {
                    try {
                        value.setName(maskString(value.getName(), 0, 4, '*'));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("user", User);
                request.setAttribute("category", category);
                request.setAttribute("products", list);
                request.setAttribute("favourite", listFavourite);
                request.setAttribute("auction", Auction);
                ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                break;
            case "/ProSearch":
                List<Favourite> listFavouritePS = FavouriteModel.findAll();
                List<User> UserPS = UserModel.findAll();
                List<Auction> AuctionPS = AuctionModel.findAll();
                for (com.example.webapp_tlcn.beans.User value : UserPS) {
                    try {
                        value.setName(maskString(value.getName(), 0, 4, '*'));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("user", UserPS);
                request.setAttribute("favourite", listFavouritePS);
                request.setAttribute("auction", AuctionPS);
                String txtSr = request.getParameter("txtSr");
                String txtSR = "%" + txtSr + "%";
                System.out.print(txtSr);
                List<Product> SrPro = ProductModel.findByTextSearch(txtSR , 0);
                request.setAttribute("txtSr", txtSr);
                request.setAttribute("products", SrPro);
                ServletUtils.forward("/views/vwProduct/ProSearch.jsp", request, response);
                break;
            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession();
                Product product = ProductModel.findById(proId);
                session.setAttribute("Product", product);
                assert product != null;
                var day = product.getEndDay().getDayOfMonth();
                var month = product.getEndDay().getMonthValue();
                var year = product.getEndDay().getYear();
                var hour = product.getEndDay().getHour();
                var minute = product.getEndDay().getMinute();
                var second = product.getEndDay().getSecond();
                request.setAttribute("day", day);
                request.setAttribute("month", month);
                request.setAttribute("year", year);
                request.setAttribute("hour", hour);
                request.setAttribute("minute", minute);
                request.setAttribute("second", second);

                request.setAttribute("product", product);
                List<Auction> TopAuctionHighestPrice = AuctionModel.findTopHighestPrice();

                List<Favourite> ListFavourite = FavouriteModel.findAll();
                request.setAttribute("favourite", ListFavourite);
                List<Product> proCat5 = ProductModel.findByCatID5(product.getCatID(), proId);
                request.setAttribute("proCat5", proCat5);
                List<User> user = UserModel.findAll();
                for (com.example.webapp_tlcn.beans.User value : user) {
                    try {
                        value.setName(maskString(value.getName(), 0, 4, '*'));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }


                request.setAttribute("user", user);
                request.setAttribute("TopAuctionHighestPrice", TopAuctionHighestPrice);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;

            case "/DetailProductEnd":
                int proId1 = Integer.parseInt(request.getParameter("id"));
                Product product1 = ProductModel.findById(proId1);
                assert product1 != null;
                request.setAttribute("product", product1);
                List<Auction> TopAuctionHighestPrice1 = AuctionModel.findTopHighestPrice();
                request.setAttribute("TopAuctionHighestPrice", TopAuctionHighestPrice1);
                List<User> user1 = UserModel.findAll();
                request.setAttribute("user", user1);
                ServletUtils.forward("/views/vwProduct/DetailProductEnd.jsp", request, response);
                break;
            case "/Event":
                int idUser = Integer.parseInt(request.getParameter("idUser"));
                int idPro = Integer.parseInt(request.getParameter("idPro"));
                int test = AuctionModel.findUserIDProID(idUser, idPro);
                boolean Event = (test == -1);
                PrintWriter out3 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out3.print(Event);
                out3.flush();
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
            case "/Favourite":
                favourite(request, response);
                break;
            case "/FavouriteEdit":
                favouriteEdit(request, response);
                break;
            case "/Auction":
                Auction(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }


    private void Auction(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idPro = Integer.parseInt(request.getParameter("idPro"));
        int price = Integer.parseInt(request.getParameter("price"));
        int countAuction = Integer.parseInt(request.getParameter("countAuction"));
        User user = UserModel.findByUserId(idUser);
        Product product = ProductModel.findById(idPro);
        assert user != null;
        assert product != null;
        int moneyPay = product.getStartingPrice() * 20/100;
        int money = user.getMoney();
        int moneyAu = user.getMoneyAu();
        int stepAu ;
        LocalDateTime Date = LocalDateTime.now(); // Create a date object
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String  StrDate = Date.format(myFormatObj);
        List<Auction> Auction = AuctionModel.findAll();
        request.setAttribute("auction", Auction);
        if (AuctionModel.findUserIDProID(idUser, idPro) == -1) {

            Auction auction = new Auction(idUser, idPro, price, 0 , Date , StrDate );
            AuctionModel.add(auction);
            int CountAuction = countAuction + 1;
            User u = new User(idUser , money - moneyPay , moneyAu + moneyPay);
            Product p = new Product(idPro, price, idUser, CountAuction ,price);
            UserModel.updateMoney(u);
            ProductModel.updateHighestPaidPrice(p);
        } else {
            int idAu = AuctionModel.findUserIDProID(idUser, idPro);
            Auction a = AuctionModel.findById(idAu);
            assert a != null;
            int priced = a.getPrice();
            Auction auction = new Auction(idAu, idUser, idPro, price , 0 , Date , StrDate);
            AuctionModel.update(auction);
            stepAu = price - priced;
            Product p = new Product(idPro, price, idUser, countAuction , price);
            ProductModel.updateHighestPaidPrice(p);
        }

        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void favouriteEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idPro = Integer.parseInt(request.getParameter("idPro"));
        int favourite = Integer.parseInt(request.getParameter("favourite"));
        int idFa = Integer.parseInt(request.getParameter("idFa"));
        Favourite Favourite = new Favourite(idFa, idUser, idPro, favourite);
        FavouriteModel.update(Favourite);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void favourite(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idPro = Integer.parseInt(request.getParameter("idPro"));
        int favourite = Integer.parseInt(request.getParameter("favourite"));
        Favourite Favourite = new Favourite(idUser, idPro, favourite);
        FavouriteModel.add(Favourite);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }
}
