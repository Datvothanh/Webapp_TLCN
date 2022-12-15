package com.example.webapp_tlcn.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;
import com.example.webapp_tlcn.recaptcha.VerifyUtils;
import com.example.webapp_tlcn.tools.tools;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import static com.example.webapp_tlcn.tools.tools.maskString;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/404";
        }
        switch (path) {
            case "/Otp":
                String email3 = request.getParameter("email");
                request.setAttribute("email", email3);
                ServletUtils.forward("/views/vwAccount/Otp.jsp", request, response);
                break;
            case "/OtpErr":
                String email4 = request.getParameter("email");
                request.setAttribute("email", email4);
                ServletUtils.forward("/views/vwAccount/OtpErr.jsp", request, response);
                break;
            case "/ForgetPassword":
                String email2 = request.getParameter("email");
                request.setAttribute("email", email2);
                ServletUtils.forward("/views/vwAccount/ForgetPassword.jsp", request, response);
                break;
            case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;
            case "/Login":
                HttpSession session = request.getSession();
                Cookie arr[] = request.getCookies();
                for (Cookie o : arr) {
                    if (o.getName().equals("_userid")) {
                        int id = Integer.parseInt(o.getValue());
                        User user = UserModel.findByUserId(id);
                        assert user != null;
                        request.setAttribute("username", user.getUsername());
                        request.setAttribute("password", user.getPassword());
                    }
                }
                if ((boolean) session.getAttribute("auth")) {
                    ServletUtils.redirect("/Home", request, response);
                } else
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            case "/Profile":
                List<Bank> bankList = BankModel.findAll();
                List<User> userList = UserModel.findAll();
                request.setAttribute("userList", userList);
                request.setAttribute("bankList", bankList);
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            case "/Info":
                int id1 = Integer.parseInt(request.getParameter("id"));
                List<Bank> bankList1 = BankModel.findAll();
                List<User> userList1 = UserModel.findAll();
                request.setAttribute("id", id1);
                request.setAttribute("userList", userList1);
                request.setAttribute("bankList", bankList1);
                ServletUtils.forward("/views/vwAccount/Info.jsp", request, response);
                break;
            case "/WatchList":
                List<Product> listAll = ProductModel.findAll(0);
                List<Favourite> listFavourite = FavouriteModel.findAll();
                request.setAttribute("productAll", listAll);
                request.setAttribute("favourite", listFavourite);
                ServletUtils.forward("/views/vwAccount/WatchList.jsp", request, response);
                break;
            case "/UpdateInfo":
                List<ListBank> listBanks = ListBankModel.findAll();
                List<Bank> BankList = BankModel.findAll();
                List<User> UserList = UserModel.findAll();
                request.setAttribute("userList", UserList);
                request.setAttribute("bankList", BankList);
                request.setAttribute("listBanks", listBanks);
                ServletUtils.forward("/views/vwAccount/UpdateSeller.jsp", request, response);
                break;
            case "/UpdateBidder":
                List<User> UserList1 = UserModel.findAll();
                request.setAttribute("userList", UserList1);
                ServletUtils.forward("/views/vwAccount/UpdateBidder.jsp", request, response);
                break;
            case "/UpdatePassword":
                List<Bank> bankList2 = BankModel.findAll();
                List<User> UserLisT = UserModel.findAll();
                request.setAttribute("bankList", bankList2);
                request.setAttribute("userList", UserLisT);
                ServletUtils.forward("/views/vwAccount/UpdatePassword.jsp", request, response);
                break;
            case "/AuctionList":
                List<Favourite> listFavourite1 = FavouriteModel.findAll();
                List<Product> ListAll = ProductModel.findAll(0);
                List<Auction> listAuction = AuctionModel.findAll();

                request.setAttribute("favourite", listFavourite1);
                request.setAttribute("productAll", ListAll);
                request.setAttribute("listAuction", listAuction);

                ServletUtils.forward("/views/vwAccount/AuctionList.jsp", request, response);
                break;

            case "/SuccessList":
                List<Product> ListAllSucces = ProductModel.findAll(1);
                List<Auction> ListAuction = AuctionModel.findAll();
                List<FeedBack> ListFeedBack = FeedBackModel.findAll();
                List<Notice> listNotices = NoticeModel.findAll();
                request.setAttribute("listNotices", listNotices);
                request.setAttribute("feedBackAll", ListFeedBack);
                request.setAttribute("productAll", ListAllSucces);
                request.setAttribute("listAuction", ListAuction);
                ServletUtils.forward("/views/vwAccount/SuccessList.jsp", request, response);
                break;
            case "/SellingList":
                List<Favourite> listFavourite2 = FavouriteModel.findAll();
                List<Product> list = ProductModel.findAll(0);
                request.setAttribute("products", list);
                request.setAttribute("favourite", listFavourite2);
                ServletUtils.forward("/views/vwAccount/SellingList.jsp", request, response);
                break;
            case "/Recharge":
                ServletUtils.forward("/views/vwAccount/Recharge.jsp", request, response);
                break;
            case "/EndingList":
                List<Product> List = ProductModel.findAll(1);
                List<Auction> Auction = AuctionModel.findAll();
                List<Notice> notices = NoticeModel.findAll();
                request.setAttribute("products", List);
                request.setAttribute("listAuction", Auction);
                request.setAttribute("notices", notices);
                ServletUtils.forward("/views/vwAccount/EndList.jsp", request, response);
                break;
            case "/FeedBack":
                int userId = Integer.parseInt(request.getParameter("idUser"));
                int proId = Integer.parseInt(request.getParameter("idPro"));
                Product product = ProductModel.findById(proId);
                User userFeedBack = UserModel.findByUserId(userId);
                assert product != null;
                User userSell = UserModel.findByUserId(product.getUserSellID());
                request.setAttribute("product", product);
                request.setAttribute("userFeedBack", userFeedBack);
                request.setAttribute("userSell", userSell);
                ServletUtils.forward("/views/vwAccount/FeedBack.jsp", request, response);
                break;
            case "/FeedBackSeller":
                int id = Integer.parseInt(request.getParameter("id"));
                int idPro = Integer.parseInt(request.getParameter("idPro"));
                List<FeedBack> ListFeedBack2 = FeedBackModel.findAll();
                User user3 = UserModel.findByUserId(id);
                try {
                    assert user3 != null;
                    user3.setName(maskString(user3.getName(), 0, 4, '*'));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("id", idPro);
                request.setAttribute("user", user3);
                request.setAttribute("feedBackAll", ListFeedBack2);
                ServletUtils.forward("/views/vwAccount/FeedBackSeller.jsp", request, response);
                break;
            case "/IsAvailableUserName":
                String username = request.getParameter("user");
                User user = UserModel.findByUsernameNotAccount(username);
                boolean isAvailable = (user == null);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
                break;
            case "/IsAvailableEmail":
                String email = request.getParameter("email");
                User user1 = UserModel.findByEmailNotAccount(email);
                boolean isAvailableEmail = (user1 == null);
                PrintWriter out1 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out1.print(isAvailableEmail);
                out1.flush();
                break;
            case "/IsAvailablePassword":
                int userID = Integer.parseInt(request.getParameter("idUser"));
                String password = request.getParameter("password");
                User user2 = UserModel.findByUserId(userID);
                assert user2 != null;
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user2.getPassword());

                boolean isAvailablePassword = (!result.verified);
                PrintWriter out2 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out2.print(isAvailablePassword);
                out2.flush();
                break;
            case "/IsAvailableSendEmail":
                String email1 = request.getParameter("email");
                User u = UserModel.findByEmail(email1);
                boolean isAvailableSendEmail = (u == null);
                PrintWriter out3 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out3.print(isAvailableSendEmail);
                out3.flush();
                break;
            case "/Event":
                List<Auction> auctions = AuctionModel.findAll();
                List<Product> products = ProductModel.findAll(1);
                List<Notice> Notices = NoticeModel.findAll();
                for (Auction a : auctions) {
                    for (Product p : products) {
                        int AId = a.getAuID();
                        int AUserId = a.getUserID();
                        int AProId = a.getProID();
                        int APrice = a.getPrice();
                        int APaid = a.getPaid();
                        int PProId = p.getProID();
                        int PUserId = p.getUserID();
                        int PStart = p.getStartingPrice() * 20 / 100; //20% giá ban đầu
                        if (AProId == PProId && APaid == 0) {//Lấy các đơn hàng chưa xét , xét id sản phẩm trùng với các đơn đâu giá
                            int pay = APrice - PStart;//Tiền phải trả của khách.
                            User User = UserModel.findByUserId(AUserId);//Tìm thông tin của khách trong đơn đấu giá này,
                            assert User != null;
                            int UserId = User.getId();//Lấy id người này.
                            String Email = User.getEmail();//Lấy email người này.
                            int money = User.getMoney();//Lấy thông tin tiền của người này.
                            int moneyAu = User.getMoneyAu();//Lấy thông tin tiền đặt cọc của người này.
                            if (PUserId == AUserId) {//Nếu người này đấu giá thắng
                                if (money >= pay) {//Đủ tiền đã trả số tiền còn lại
                                    User U = new User(UserId, money - pay, moneyAu - PStart);
                                    UserModel.updateMoney(U);//Cập nhật tiền cho người đấu giá thắng món hàng này: trừ tiền đấu giá vào tài khoảng chính và xóa tiền cọc của sp này.
                                    Product Product = new Product(p.getProID(), p.getStartingPrice(), p.getCatID(), p.getStepPrice(), p.getHighestPaidPrice(), p.getProName(), p.getTinyDes(), p.getFullDes(), p.getEndDay(), p.getTop(), p.getYear(), p.getMonth(), p.getDay(), p.getDay(), p.getMinute(), p.getSecond(), 0, 1 , p.getStrDate());
                                    ProductModel.update(Product);//Cập nhật sản phẩm này đã được thanh toán rồi.
                                    Notice n = new Notice(p.getUserSellID(), "Bạn cần giao hàng cho khách", 0, LocalDateTime.now().plusDays(7), p.getHighestPaidPrice(), 2, PProId);
                                    NoticeModel.add(n);//Tạo thông báo yêu cầu giao hàng cho khách
                                    User User1 = UserModel.findByUserId(p.getUserSellID());
                                    assert User1 != null;
                                    String emailSubject = "Request delivery to customers";
                                    String emailContent = "Request you to deliver to the customer who ordered the product with the code:" + p.getProID();
                                    tools.email(User1.getEmail(), emailSubject, emailContent);//Gửi cho người bán: sản phẩm này đã bán thành công và yêu cầu bạn gửi hàng!
                                    String emailSubject1 = "Successful auction";
                                    String emailContent1 = "You have made a successful purchase with the product code:" + p.getProID();
                                    tools.email(User.getEmail(), emailSubject1, emailContent1);//Gửi cho khách: bạn đã mua thành công!
                                } else {//Không đủ tiền để trả
                                    User U = new User(UserId, money, moneyAu - PStart);
                                    UserModel.updateMoney(U); //Cập nhật tiền cho người đấu giá thắng món hàng này: xóa tiền cọc của sp này.
                                    Notice n = new Notice(UserId, "Bạn cần nạp vào tài khoản thêm: " + pay, 0, LocalDateTime.now().plusDays(1), pay, 1, PProId);
                                    NoticeModel.add(n);//Tạo thông báo yêu cầu thanh toán số tiền còn lại trong vòng 24h.
                                    String emailSubject = "Request more money";
                                    String emailContent = "You require additional funds to be added to your account to complete payment of the amount: " + pay + " of products with code: " + PProId + ", If after 24 hours you do not pay, you will lose the deposit with the amount of: " + PStart;
                                    tools.email(Email, emailSubject, emailContent);// Gửi cho khách: bạn cần nạp tiền để thanh toán số tiền còn lại nếu không bạn sẽ mất cọc!
                                }

                            } else {//Không phải người đấu giá thắng
                                User U1 = new User(UserId, money + PStart, moneyAu - PStart);
                                UserModel.updateMoney(U1);//Cập nhật tiền cho người đấu giá thất bại món hàng này: cộng tiền đã cộc vào tài khoản chính và trừ tiền đặt cọc món hàng này.
                                String emailSubject = "Auction failed";
                                String emailContent = "You have failed to bid on a product with code: " + PProId;
                                tools.email(Email, emailSubject, emailContent);// Gửi cho khách:Bạn đã đấu giá thất bại!
                            }
                            Auction auction = new Auction(AId, 1);
                            AuctionModel.updatePaid(auction);//Cập nhật đã xét đơn đấu giá này.
                        }
                    }
                }

                for (Product p : products){
                    if( p.getUserID() == -1 && p.getPaid() == 0){
                        User U = UserModel.findByUserId(p.getUserSellID());
                        assert U != null;
                        Product P = new Product(p.getProID(), p.getStartingPrice(), p.getCatID(), p.getStepPrice(), p.getHighestPaidPrice(), p.getProName(), p.getTinyDes(), p.getFullDes(), p.getEndDay(), p.getTop(), p.getYear(), p.getMonth(), p.getDay(), p.getDay(), p.getMinute(), p.getSecond(), p.getDelete(), -1 , p.getStrDate());
                        ProductModel.update(P);
                        String emailSubject = "Selling failed";
                        String emailContent = "Products with code:" + p.getProID() + " No one participated in the auction";
                        tools.email(U.getEmail(), emailSubject, emailContent);// Gửi cho khách: bạn cần nạp tiền để thanh toán số tiền còn lại nếu không bạn sẽ mất cọc!
                    }
                }

                for (Notice n : Notices) {
                    User User1 = UserModel.findByUserId(n.getIdUser());// Lấy thông tin của người nhận thông báo
                    assert User1 != null;
                    String Email1 = User1.getEmail();//Lấy Email
                    Product p = ProductModel.findById(n.getIdPro());//Lấy thông tin sản phẩm
                    assert p != null;
                    if (n.getStt() == 1) {// Xét những thông báo của khách cần trả số tiền còn lại mà chưa trả
                        if (n.getType() == 0) {//Nếu còn thời để thanh toán
                            if (User1.getMoney() >= n.getPrice()) {//Nếu tiền của người đó đủ để thanh toán số tiền còn lại
                                User U1 = new User(User1.getId(), User1.getMoney() - n.getPrice(), User1.getMoneyAu());
                                UserModel.updateMoney(U1);//Người khách đó phải bị trừ số tiền phải trả còn lại.
                                Notice N = new Notice(n.getId(), n.getIdUser(), "Bạn đã trả xong số tiền còn lại", n.getType(), n.getDateEnd(),0, 0, n.getIdPro());
                                NoticeModel.update(N); //Cập nhật thông báo là đã thanh toán trước thời hạn
                                Product Product1 = new Product(p.getProID(), p.getStartingPrice(), p.getCatID(), p.getStepPrice(), p.getHighestPaidPrice(), p.getProName(), p.getTinyDes(), p.getFullDes(), p.getEndDay(), p.getTop(), p.getYear(), p.getMonth(), p.getDay(), p.getDay(), p.getMinute(), p.getSecond(), 0, 1 , p.getStrDate());
                                ProductModel.update(Product1);//Cập nhật sản phẩm này đã được thanh toán rồi.
                                Notice n1 = new Notice(p.getUserSellID(), "Bạn cần giao hàng cho khách", 0, LocalDateTime.now().plusDays(7), p.getHighestPaidPrice(), 2, p.getProID());
                                NoticeModel.add(n1);//Tạo thông báo cho người bán sản phẩm này: yêu cầu giao hàng cho khách!
                                User UserSell = UserModel.findByUserId(p.getUserSellID());//Tìm thông tin của người bán
                                assert UserSell != null;
                                String emailSubject = "Request delivery to customers";
                                String emailContent = "Request you to deliver to the customer who ordered the product with the code:" + p.getProID() + ", Please confirm after delivery!";
                                tools.email(UserSell.getEmail(), emailSubject, emailContent);// Gửi cho người bán: Bạn hãy giao hàng cho khách!
                                String emailSubject1 = "Successful auction";
                                String emailContent1 = "You have made a successful purchase with the product code:" + p.getProID();
                                tools.email(Email1, emailSubject1, emailContent1);// Gửi cho người khách: Bạn đã đấu giá thành công!
                            }

                        }
                        if (n.getType() == 1) {//Nếu hét thời gian thanh toán
                            User UserSell = UserModel.findByUserId(p.getUserSellID());//Tìm thông tin người bán này
                            assert UserSell != null;
                            User U1 = new User(UserSell.getId(), UserSell.getMoney() + (p.getStartingPrice() * 20 / 100), UserSell.getMoneyAu());
                            UserModel.updateMoney(U1);//Trả lại tiền cộc 20% giá sản phẩm bắt đầu cho người bán.
                            Notice N = new Notice(n.getId(), n.getIdUser(),"Bạn đã mất cộc", n.getType(), n.getDateEnd(), n.getPrice(), -1, n.getIdPro());
                            NoticeModel.update(N);//Cập nhật thông báo là người này mất cộc
                            String emailSubject = "Notice of loss of deposit";
                            String emailContent = "You have not paid us for the product with the code: " + n.getIdPro() + " and you lost your money with the money : " + p.getStartingPrice() * 20 / 100;
                            tools.email(Email1, emailSubject, emailContent);//Thông báo cho khách: bạn đã mất tiền cộc.
                            String emailSubject1 = "Selling failed product";
                            String emailContent1 = "Buyer did not pay for product with code: " + n.getIdPro() + " ,We refunded your deposit.";
                            tools.email(UserSell.getEmail(), emailSubject1, emailContent1);//Thông báo cho người bán: bán hàng thất bại.
                        }
                    }
                    if (n.getStt() == 2) {
                        if (n.getType() == 0) {//Nếu còn thời để giao
                            if(p.getShip() == 1){//Đã giao rồi
                                User U = UserModel.findByUserId(p.getUserID());//Lấy thông tin người mua
                                assert U != null;
                                Notice N = new Notice(n.getId(), n.getIdUser(), "Đã giao hàng", n.getType(), n.getDateEnd() , n.getPrice(), 3, n.getIdPro());
                                NoticeModel.update(N);//Cập nhật thông báo là người bán đã giao hàng.
                                String emailSubject = "Delivered";
                                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                                String formattedDate = LocalDateTime.now().format(myFormatObj);
                                String emailContent = "Seller of products with code: " + n.getIdPro() + " delivered to you at "+ formattedDate +", please confirm your order has arrived.";
                                tools.email( U.getEmail(), emailSubject, emailContent);//Thông báo cho khách: đã giao hàng tới.
                            }
                        }
                        if (n.getType() == 1) {//Nếu hét thời gian để giao
                            if(p.getShip() == 0){//Chưa giao
                                User U = UserModel.findByUserId(p.getUserID());//Lấy thông tin người mua
                                assert U != null;
                                User U1 = new User(U.getId(), U.getMoney() + n.getPrice() + (p.getStartingPrice() * 20/100), U.getMoneyAu());
                                UserModel.updateMoney(U1);//Người khách được hoàn tiền lại.
                                Notice N = new Notice(n.getId(), n.getIdUser(), "Chưa giao hàng", n.getType(), n.getDateEnd(), n.getPrice(), -2, n.getIdPro());
                                NoticeModel.update(N);//Cập nhật thông báo là người bán chưa giao hàng.
                                Product P = new Product(p.getProID() , -1);
                                ProductModel.updateShip(P);
                                String emailSubject = "Delivery failed";
                                String emailContent = "The seller did not deliver the item to you with the product code: " + n.getIdPro() + ", We will refund.";
                                tools.email( U.getEmail(), emailSubject, emailContent);//Thông báo cho khách: giao hàng thất bại.
                                String emailSubject1 = "Delivery failed";
                                String emailContent1 = "You delivered late than the specified time of products with code: " + n.getIdPro() + ", you will lose your deposit.";
                                tools.email( Email1, emailSubject1, emailContent1);//Thông báo cho người bán: giao hàng trễ so với thời gian quy định nên không trã tiền cộc.
                                //Thêm một nhận xét xấu từ Admin
                            }
                        }

                    }
                    if (n.getStt() == 3) {
                        if (n.getType() == 0) {//Nếu còn thời để giao
                            if(p.getShip() == 2){//Đã xác nhận nhận được hàng
                                Notice N = new Notice(n.getId(),p.getUserID(), "Đã nhận hàng", n.getType(), n.getDateEnd() , n.getPrice(), 4, n.getIdPro());
                                NoticeModel.update(N);//Cập nhật thông báo là người mua đã nhận hàng.
                                User U1 = new User(User1.getId(), User1.getMoney() + p.getStartingPrice() * 20/100, User1.getMoneyAu());
                                UserModel.updateMoney(U1);//Người bán được hoàn tiền lại.
                                String emailSubject1 = "Successful sale";
                                String emailContent1 = "You have successfully sold the product with the code: " + n.getIdPro() + ",We will transfer the money to you.";
                                tools.email( Email1, emailSubject1, emailContent1);//Thông báo cho người bán: bán hàng thành công.
                                //Tạo đơn chuyển tiền cho người bán
                            }
                        }
                        if (n.getType() == 1) {//Nếu hét thời gian để giao
                            if(p.getShip() == 1){//Chưa xác nhận đã nhận hàng
                                User U = UserModel.findByUserId(p.getUserID());//Lấy thông tin người mua
                                assert U != null;
//                                User U1 = new User(U.getId(), U.getMoney() + n.getPrice() , U.getMoneyAu());
//                                UserModel.updateMoney(U1);//Người khách được hoàn tiền lại.
                                Notice N = new Notice(n.getId(), p.getUserID(), "Người nhận chưa nhận được hàng", n.getType(), n.getDateEnd(), n.getPrice(), -3, n.getIdPro());
                                NoticeModel.update(N);//Cập nhật thông báo là khách chưa nhận được hàng.
                                Product P = new Product(p.getProID() , -2);
                                ProductModel.updateShip(P);
                                String emailSubject = "Delivery failed for customer";
                                String emailContent = "The seller did not deliver the item to you with the product code: " + n.getIdPro() + ", we will consider.";
                                tools.email( U.getEmail(), emailSubject, emailContent);//Thông báo cho khách: giao hàng thất bại.
                                String emailSubject1 = "Delivery failed for  seller";
                                String emailContent1 = "The customer has not received the product with the code: " + n.getIdPro() + ", we will consider.";
                                tools.email( Email1, emailSubject1, emailContent1);//Thông báo cho người bán: người nhận chưa xác nhận nhận hàng nên không trã tiền cộc.

                            }
                        }


                    }
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/Delete":
                deleteUser(request, response);
                break;
            case "/ForgetPassword":
                forgetPassword(request, response);
                break;
            case "/UpdatePermission":
                updatePermission(request, response);
                break;
            case "/Otp":
                otpUser(request, response);
                break;
            case "/OtpErr":
                otpErrUser(request, response);
                break;
            case "/UpdatePassword":
                updatePassword(request, response);
                break;
            case "/Register":
                registerUser(request, response);
                break;
            case "/Login":
                loginUser(request, response);
                break;
            case "/Logout":
                logoutUser(request, response);
                break;
            case "/UpdateInfo":
                updateUserSeller(request, response);
                break;
            case "/UpdateBidder":
                updateUserBidder(request, response);
                break;
            case "/FeedBack":
                feedBack(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }

    private void forgetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("Email");
        String rawpwd = request.getParameter("NewPassword");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        User u = UserModel.findByEmail(email);
        assert u != null;
        User User = new User(u.getId(), u.getPermission(), u.getCode(), u.getUsername(), bcryptHashString, u.getName(), u.getEmail(), u.getDob(), u.getMoney(), u.getMoneyAu(), u.getAddress(), u.getPhone());
        UserModel.update(User);
        String url = "/Account/Login";
        ServletUtils.redirect(url, request, response);
    }


    private void feedBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int happy = Integer.parseInt(request.getParameter("happy"));
        int userFbID = Integer.parseInt(request.getParameter("userFbID"));
        int userSellID = Integer.parseInt(request.getParameter("userSellID"));
        int ProID = Integer.parseInt(request.getParameter("proID"));
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String  StrDate = LocalDateTime.now().format(myFormatObj);
        String FeedBack = request.getParameter("feedBack");
        FeedBack feedBack = new FeedBack(ProID, userFbID, userSellID, happy, FeedBack , LocalDateTime.now() ,  StrDate);
        FeedBackModel.add(feedBack);
        ServletUtils.redirect("/Account/SuccessList", request, response);
    }


    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String rawpwd = request.getParameter("newPassword");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        int userID = Integer.parseInt(request.getParameter("id"));
        User user = UserModel.findByUserId(userID);
        if (user != null) {
            User u = new User(userID, user.getPermission(), user.getCode(), user.getUsername(), bcryptHashString, user.getName(), user.getEmail(), user.getDob(), user.getMoney(), user.getMoneyAu(), user.getAddress(), user.getPhone());
            UserModel.update(u);
        }
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }


    private void updateUserBidder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String strDob = request.getParameter("dob");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");//theo format của java
        LocalDate dob = LocalDate.parse(strDob, df);
        String address = request.getParameter("address");
        User user = UserModel.findByUserId(userID);
        if (user != null) {
            User u = new User(userID, user.getPermission(), user.getCode(), user.getUsername(), user.getPassword(), name, email, dob, user.getMoney(), user.getMoneyAu(), address, phone);
            UserModel.update(u);
        }
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updateUserSeller(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID = Integer.parseInt(request.getParameter("id"));
        String idB = request.getParameter("idB");
        String inputBank = request.getParameter("inputBank");
        String idBank = request.getParameter("idBank");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String strDob = request.getParameter("dob");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");//theo format của java
        LocalDate dob = LocalDate.parse(strDob, df);
        String address = request.getParameter("address");
        User user = UserModel.findByUserId(userID);
        Bank bank = BankModel.findByUserId(userID);
        if (user != null) {
            User u = new User(userID, user.getPermission(), user.getCode(), user.getUsername(), user.getPassword(), name, email, dob, user.getMoney(), user.getMoneyAu(), address, phone);
            UserModel.update(u);
        }
        if (!inputBank.isEmpty() && !idBank.isEmpty()) {
            if (bank != null) {
                Bank b = new Bank(bank.getId(), userID, inputBank, idBank);
                BankModel.update(b);
            } else {
                Bank b = new Bank(userID, inputBank, idBank);
                BankModel.add(b);
            }
        }
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID = Integer.parseInt(request.getParameter("idUser"));
        UserModel.delete(userID);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updatePermission(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID = Integer.parseInt(request.getParameter("idUser"));
        int permission = Integer.parseInt(request.getParameter("permission"));
        User user = new User(userID, permission);
        UserModel.updatePermission(user);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void otpUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int Code = Integer.parseInt(request.getParameter("code"));
        String codeInt1 = request.getParameter("1");
        String codeInt2 = request.getParameter("2");
        String codeInt3 = request.getParameter("3");
        String codeInt4 = request.getParameter("4");
        String codeInt5 = request.getParameter("5");
        String codeInt6 = request.getParameter("6");
        String email1 = request.getParameter("email");
        String codeString = codeInt1.concat(codeInt2).concat(codeInt3).concat(codeInt4).concat(codeInt5).concat(codeInt6);
        int codeInt = Integer.parseInt(codeString);
        User user = UserModel.findByCode(codeInt);
        if (user == null) {
            String url = "/Account/OtpErr?email=" + email1;
            ServletUtils.redirect(url, request, response);
        } else {
            int id = user.getId();
            int permission = 1;
            int code = 1;
            String bcryptHashString = user.getPassword();
            LocalDate Dob = user.getDob();
            String username = user.getUsername();
            String name = user.getName();
            String email = user.getEmail();
            String address = user.getAddress();
            String phone = user.getPhone();
            User User = new User(id, permission, code, username, bcryptHashString, name, email, Dob, 0, 0, address, phone);
            UserModel.update(User);
            HttpSession session = request.getSession();
            session.setAttribute("otp", false);
            session.setAttribute("auth", true);
            session.setAttribute("authUser", user);//Tắt quyền vào trang OTP
            String url = "/Home";
            ServletUtils.redirect(url, request, response);
        }

    }

    private void otpErrUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int Code = Integer.parseInt(request.getParameter("code"));
        String codeInt1 = request.getParameter("1");
        String codeInt2 = request.getParameter("2");
        String codeInt3 = request.getParameter("3");
        String codeInt4 = request.getParameter("4");
        String codeInt5 = request.getParameter("5");
        String codeInt6 = request.getParameter("6");
        String email1 = request.getParameter("email");
        String codeString = codeInt1.concat(codeInt2).concat(codeInt3).concat(codeInt4).concat(codeInt5).concat(codeInt6);
        int codeInt = Integer.parseInt(codeString);
        User user = UserModel.findByCode(codeInt);
        if (user == null) {
            String url = "/Account/OtpErr?email=\"+ email";
            ServletUtils.redirect(url, request, response);
        } else {
            int id = user.getId();
            int permission = 1;
            int code = 1;
            String bcryptHashString = user.getPassword();
            LocalDate Dob = user.getDob();
            String username = user.getUsername();
            String name = user.getName();
            String email = user.getEmail();
            String address = user.getAddress();
            String phone = user.getPhone();
            User User = new User(id, permission, code, username, bcryptHashString, name, email, Dob, 0, 0, address, phone);
            UserModel.update(User);
            HttpSession session = request.getSession();
            session.setAttribute("otp", false);
            session.setAttribute("auth", true);
            session.setAttribute("authUser", user);//Tắt quyền vào trang OTP
            String url = "/Home";
            ServletUtils.redirect(url, request, response);
        }

    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean valid = true;
        String errorString = null;
        Random dice = new Random();
        int numberRandom = 100000 + dice.nextInt(899999);
        int code = numberRandom;

        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDob = request.getParameter("dob");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");//theo format của java
        LocalDate Dob = LocalDate.parse(strDob, df);

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        if (valid) {
//            System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
            // Verify CAPTCHA.
            valid = VerifyUtils.verify(gRecaptchaResponse);
            if (!valid) {
                errorString = "Chưa xác nhận Captcha!";
            }
        }
        if (!valid) {
            request.setAttribute("errorString", errorString);
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/vwAccount/Register.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            //Note: tạo riêng một class java gửi Email rồi gọi nó ra.
            final String usernameEmail = "19110186@student.hcmute.edu.vn";
            final String passwordEmail = "Tao?may2cau";
            String emailSubject = "Mã OTP";
            String emailContent = String.valueOf(numberRandom);

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(usernameEmail, passwordEmail);
                }
            };
            Session sessionEmail = Session.getInstance(prop, auth);
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
            int permission = 4;
            User user = new User(permission, code, username, bcryptHashString, name, email, Dob, 0, 0, address, phone);
            UserModel.add(user);
            HttpSession session = request.getSession(); //Dùng chung cho mọi request
            session.setAttribute("otp", true); //Bật quyền vào trang OTP
            ServletUtils.redirect("/Account/Otp?email=" + email, request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        if (email == null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User user = UserModel.findByUsername(username);

            if (user != null) {
                if (user.getPermission() != 4) {
                    int id = user.getId();
                    String ID = String.valueOf(id);
                    BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                    if (result.verified) {
                        HttpSession session = request.getSession(); //Dùng chung cho mọi request
                        session.setAttribute("auth", true);
                        session.setAttribute("authUser", user);

//                Lưu account lên trân cookie

                        Cookie userID = new Cookie("_userid", ID);
                        userID.setMaxAge(60 * 60 * 24 * 365);
                        userID.setPath("/");
                        response.addCookie(userID);
                        String url;
                        if (user.getPermission() == 0) {
                            url = "/Admin";
                        } else {
                            url = "/Home";
                        }
                        ServletUtils.redirect(url, request, response);

                    } else {
                        request.setAttribute("hasError", true); //Thông báo lỗi
                        request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng."); // Thông báo lỗi
                        ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                    }
                } else {
                    request.setAttribute("hasError", true); //Thông báo lỗi
                    request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng."); // Thông báo lỗi
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }
            } else {
                request.setAttribute("hasError", true); //Thông báo lỗi
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng."); // Thông báo lỗi
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            //Note: tạo riêng một class java gửi Email rồi gọi nó ra.
            final String usernameEmail = "19110186@student.hcmute.edu.vn";
            final String passwordEmail = "Tao?may2cau";
            String emailSubject = "Forget Password";
            String emailContent = "http://localhost:8080/Webapp_TLCN/Account/ForgetPassword?email=" + usernameEmail;

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(usernameEmail, passwordEmail);
                }
            };
            Session sessionEmail = Session.getInstance(prop, auth);
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
            ServletUtils.redirect("/Account/Login", request, response);
        }

    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());
        Cookie cookie = null;
        Cookie[] cookies = null;
        // Get an array of Cookies associated with this domain
        cookies = request.getCookies();

        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if ((cookie.getName()).compareTo("_userid") == 0) {
                    // delete cookie
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        String url = request.getHeader("referer");
        if (url == null)
            url = "/Home";
        ServletUtils.redirect(url, request, response);
    }
}

