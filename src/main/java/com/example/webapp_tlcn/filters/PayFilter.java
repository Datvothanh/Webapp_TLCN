package com.example.webapp_tlcn.filters;


import com.example.webapp_tlcn.beans.Auction;
import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.models.AuctionModel;
import com.example.webapp_tlcn.models.ProductModel;
import com.example.webapp_tlcn.models.UserModel;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebFilter(filterName = "PayFilter")
public class PayFilter implements Filter {
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
        }else {
            boolean auth = (boolean) session.getAttribute("auth");
            if(auth){
                User user = (User) session.getAttribute("authUser");
                List<Auction> auctions = AuctionModel.findAll();
                List<Product> products = ProductModel.findAll(1);
                int permission = user.getPermission();
                int UserId = user.getId();
                int money = user.getMoney();
                int moneyAu = user.getMoneyAu();
                for (Auction a : auctions) {
                    for (Product p : products) {
                        int AId = a.getAuID();
                        int AUserId = a.getUserID();
                        int AProId = a.getProID();
                        int APrice = a.getPrice();
                        int APaid = a.getPaid();
                        int PProId = p.getProID();
                        int PUserId = p.getUserID();
                        if(AUserId == UserId && AProId == PProId && APaid == 0 ){
                            if(PUserId == UserId){
                                User u = new User(UserId , money , moneyAu - APrice);
                                UserModel.updateMoney(u);
                            } else {
                                User u = new User(UserId , money + APrice , moneyAu - APrice);
                                UserModel.updateMoney(u);
                            }
                            Auction auction = new Auction(AId, 1);
                            AuctionModel.updatePaid(auction);
                        }
                    }
                }
            }
        }


        chain.doFilter(req, res);
    }
}
