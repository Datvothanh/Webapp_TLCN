package com.example.webapp_tlcn;

import com.example.webapp_tlcn.beans.Auction;
import com.example.webapp_tlcn.beans.Notice;
import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.models.AuctionModel;
import com.example.webapp_tlcn.models.NoticeModel;
import com.example.webapp_tlcn.models.ProductModel;
import com.example.webapp_tlcn.models.UserModel;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;

public class main {
    public main(String[] args) throws Exception {
        ServerSocket serverSocket = new ServerSocket(1099);
        Socket socket = serverSocket.accept();
        DataInputStream dataInputStream = new DataInputStream(socket.getInputStream());
        DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());
        Scanner scanner = new Scanner(System.in);
        while (true) {
            List<Auction> auctions = AuctionModel.findAll();
            List<Product> products = ProductModel.findAll(1);
            for (Auction a : auctions) {
                for (Product p : products) {
                    int AId = a.getAuID();
                    int AUserId = a.getUserID();
                    int AProId = a.getProID();
                    int APrice = a.getPrice();
                    int APaid = a.getPaid();
                    int PProId = p.getProID();
                    int PUserId = p.getUserID();
                    int PUserSellId = p.getUserSellID();
                    int PStart = p.getStartingPrice() * 20 / 100;
                    if (AProId == PProId && APaid == 0) {
                        int pay = APrice - PStart;
                        User user = UserModel.findByUserId(AUserId);
                        assert user != null;
                        int UserId = user.getId();
                        String email = user.getEmail();
                        int money = user.getMoney();
                        int moneyAu = user.getMoneyAu();
                        if (PUserId == AUserId) {
                            if (money >= pay) {
                                User u = new User(UserId, money - pay, moneyAu - PStart);
                                UserModel.updateMoney(u);
                                Product product1 = ProductModel.findById(PProId);
                                assert product1 != null;
                                Product product = new Product(product1.getProID(), product1.getStartingPrice(), product1.getCatID(), product1.getStepPrice(), product1.getHighestPaidPrice(), product1.getProName(), product1.getTinyDes(), product1.getFullDes(), product1.getEndDay(), product1.getTop(), product1.getYear(), product1.getMonth(), product1.getDay(), product1.getDay(), product1.getMinute(), product1.getSecond(), 0, 1 , product1.getStrDate());
                                ProductModel.update(product);
                                Notice n = new Notice(product1.getUserSellID(), "Bạn cần giao hàng cho khách", 0, LocalDateTime.now().plusDays(7), product1.getHighestPaidPrice(), 2, PProId);
                                NoticeModel.add(n);//Tạo thông báo yêu cầu giao hàng cho khách
                                User user1 = UserModel.findByUserId(product1.getUserSellID());
                                assert user1 != null;
                                final String usernameEmail = "19110186@student.hcmute.edu.vn";
                                final String passwordEmail = "Tao?may2cau";
                                String emailSubject = "Yêu cầu giao hàng đến khách";
                                String emailContent = "Yêu cầu bạn giao hàng đến khách đã đặt mua đấu giá sản phẩm có mã:" + product1.getProID();

                                Properties prop = new Properties();
                                prop.put("mail.smtp.host", "smtp.gmail.com");
                                prop.put("mail.smtp.port", "587");
                                prop.put("mail.smtp.auth", "true");
                                prop.put("mail.smtp.starttls.enable", "true");
                                Authenticator Auth = new Authenticator() {
                                    protected PasswordAuthentication getPasswordAuthentication() {
                                        return new PasswordAuthentication(usernameEmail, passwordEmail);
                                    }
                                };
                                Session sessionEmail = Session.getInstance(prop, Auth);
                                //Đăng nhập được email
                                try {
                                    MimeMessage message = new MimeMessage(sessionEmail);
                                    message.setFrom(new InternetAddress(usernameEmail));

                                    message.setRecipients(
                                            Message.RecipientType.TO, InternetAddress.parse(user1.getEmail())
                                    );
                                    message.setSubject(emailSubject);
                                    message.setText(emailContent);
                                    Transport.send(message);
                                } catch (Exception e) {

                                }
                            } else {
                                User u = new User(UserId, money, moneyAu - PStart);
                                UserModel.updateMoney(u); // Lấy tiền cộc
                                Notice n = new Notice(UserId, "Bạn cần nạp vào tài khoản thêm: " + pay, 0, LocalDateTime.now().plusDays(1), pay, 1, PProId);
                                NoticeModel.add(n);//Tạo thông báo yêu cầu thanh toán số tiền còn lại
                                final String usernameEmail = "19110186@student.hcmute.edu.vn";
                                final String passwordEmail = "Tao?may2cau";
                                String emailSubject = "Yêu cầu nạp tiền";
                                String emailContent = "Bạn yêu cầu nạp tiền thêm vào tài khoản để trả hoàn thành số tiền đấu giá còn lại là: " + pay + ", nếu sau 24h bạn không thanh toán sẽ mất cọc với số tiền là: " + PStart;

                                Properties prop = new Properties();
                                prop.put("mail.smtp.host", "smtp.gmail.com");
                                prop.put("mail.smtp.port", "587");
                                prop.put("mail.smtp.auth", "true");
                                prop.put("mail.smtp.starttls.enable", "true");
                                Authenticator Auth = new Authenticator() {
                                    protected PasswordAuthentication getPasswordAuthentication() {
                                        return new PasswordAuthentication(usernameEmail, passwordEmail);
                                    }
                                };
                                Session sessionEmail = Session.getInstance(prop, Auth);
                                //Đăng nhập được email
                                try {
                                    MimeMessage message = new MimeMessage(sessionEmail);
                                    message.setFrom(new InternetAddress(usernameEmail));
                                    message.setRecipients(
                                            Message.RecipientType.TO, InternetAddress.parse(email)
                                    );
                                    message.setSubject(emailSubject);
                                    message.setText(emailContent);
                                    Transport.send(message);
                                } catch (Exception e) {

                                }
                            }

                        } else {
                            User u = new User(UserId, money + PStart, moneyAu - PStart);
                            UserModel.updateMoney(u);
                        }
                        Auction auction = new Auction(AId, 1);
                        AuctionModel.updatePaid(auction);
                    }
                }
            }
        }
    }


}
