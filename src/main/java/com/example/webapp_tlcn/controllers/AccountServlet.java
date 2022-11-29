package com.example.webapp_tlcn.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.webapp_tlcn.beans.*;
import com.example.webapp_tlcn.models.*;
import com.example.webapp_tlcn.recaptcha.VerifyUtils;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import javax.servlet.ServletException;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.util.Properties;
import java.util.Random;

import static com.example.webapp_tlcn.tools.mask.maskString;

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
                request.setAttribute("email" , email3);
                ServletUtils.forward("/views/vwAccount/Otp.jsp", request , response);
                break;
            case "/ForgetPassword":
                String email2 = request.getParameter("email");
                request.setAttribute("email" , email2);
                ServletUtils.forward("/views/vwAccount/ForgetPassword.jsp", request, response);
                break;
            case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;
            case "/Login":
                HttpSession session = request.getSession();
                    Cookie arr[] = request.getCookies();
                    for (Cookie o :arr){
                        if(o.getName().equals("_userid")){
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
                request.setAttribute("userList" , userList);
                request.setAttribute("bankList" , bankList);
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            case "/WatchList":
                List<Product> listAll = ProductModel.findAll(0);
                List<Favourite> listFavourite = FavouriteModel.findAll();
                request.setAttribute("productAll", listAll);
                request.setAttribute("favourite", listFavourite);
                ServletUtils.forward("/views/vwAccount/WatchList.jsp", request, response);
                break;
            case "/Update":
                List<ListBank> listBanks = ListBankModel.findAll();
                List<Bank> BankList = BankModel.findAll();
                List<User> UserList = UserModel.findAll();
                request.setAttribute("userList" , UserList);
                request.setAttribute("BankList" , BankList);
                request.setAttribute("listBanks" , listBanks);
                ServletUtils.forward("/views/vwAccount/Update.jsp", request, response);
                break;
            case "/UpdatePassword":
                List<User> UserLisT = UserModel.findAll();
                request.setAttribute("userList" , UserLisT);
                ServletUtils.forward("/views/vwAccount/UpdatePassword.jsp", request, response);
                break;
            case "/UpdateBank":
                List<User> UserLisT1 = UserModel.findAll();
                request.setAttribute("userList" , UserLisT1);
                ServletUtils.forward("/views/vwAccount/UpdateBank.jsp", request, response);
                break;
            case "/AuctionList":
                List<Product> ListAll = ProductModel.findAll(0);
                List<Auction> listAuction = AuctionModel.findAll();
                request.setAttribute("productAll", ListAll);
                request.setAttribute("listAuction", listAuction);
                ServletUtils.forward("/views/vwAccount/AuctionList.jsp", request, response);
                break;
            case "/SuccessList":
                List<Product> ListAllSucces = ProductModel.findAll(1);
                List<Auction> ListAuction = AuctionModel.findAll();
                List<FeedBack> ListFeedBack = FeedBackModel.findAll();
                request.setAttribute("feedBackAll", ListFeedBack);
                request.setAttribute("productAll", ListAllSucces);
                request.setAttribute("listAuction", ListAuction);
                ServletUtils.forward("/views/vwAccount/SuccessList.jsp", request, response);
                break;
            case "/SellingList":
                List<Product> list = ProductModel.findAll(0 );
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwAccount/SellingList.jsp", request, response);
                break;
            case "/Recharge":
                ServletUtils.forward("/views/vwAccount/Recharge.jsp", request, response);
                break;
            case "/EndingList":
                List<Product> List = ProductModel.findAll(1 );
                List<Auction> Auction = AuctionModel.findAll();
                request.setAttribute("products", List);
                request.setAttribute("listAuction", Auction);
                ServletUtils.forward("/views/vwAccount/EndList.jsp", request, response);
                break;
            case "/FeedBack":
                int userId =  Integer.parseInt(request.getParameter("idUser"));
                int proId =  Integer.parseInt(request.getParameter("idPro"));
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
                int id =  Integer.parseInt(request.getParameter("id"));
                List<FeedBack> ListFeedBack2 = FeedBackModel.findAll();
                User user3 = UserModel.findByUserId(id);
                try {
                    assert user3 != null;
                    user3.setName(maskString(user3.getName(), 0, 4, '*'));
                } catch (Exception e) {
                    e.printStackTrace();
                }
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
                int userID =  Integer.parseInt(request.getParameter("idUser"));
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
                deleteUser(request,response);
                break;
            case "/ForgetPassword":
                forgetPassword(request,response);
                break;
            case "/UpdatePermission":
                updatePermission(request,response);
                break;
            case "/Otp":
                otpUser(request,response);
                break;
            case "/UpdatePassword":
                updatePassword(request,response);
                break;
            case "/UpdateBank":
                updateBank(request,response);
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
            case "/Update":
                updateUser(request,response);
                break;
            case "/Profile":
                updateImg(request,response);
                break;
            case "/FeedBack":
                feedBack(request,response);
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
        User User = new User(u.getId() , u.getPermission() , u.getCode() , u.getUsername() , bcryptHashString , u.getName() , u.getEmail() , u.getDob() , u.getMoney() , u.getMoneyAu() , u.getAddress() , u.getPhone() );
        UserModel.update(User);
        String url = "/Account/Login";
        ServletUtils.redirect(url, request, response);
    }


    private void feedBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int happy =  Integer.parseInt(request.getParameter("happy"));
        int userFbID =  Integer.parseInt(request.getParameter("userFbID"));
        int userSellID =  Integer.parseInt(request.getParameter("userSellID"));
        int ProID =  Integer.parseInt(request.getParameter("proID"));
        String FeedBack = request.getParameter("feedBack");
        FeedBack feedBack = new FeedBack(ProID,userFbID , userSellID , happy , FeedBack);
        FeedBackModel.add(feedBack);
        ServletUtils.redirect("/Account/SuccessList", request, response);
    }

    private void updateImg(HttpServletRequest request, HttpServletResponse response) throws  ServletException , IOException {
        Part part = request.getPart("ImageUser");
        String idUser = request.getParameter("idUser");
        String realpath = "/public/imgs/avatar/";
        String realPathAll = realpath.concat(idUser);
        String realPathAll2 = realPathAll.concat("/main.jpg");
        String realPath = this.getServletContext().getRealPath(realPathAll);
        String realPath2 = this.getServletContext().getRealPath(realPathAll2);
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        if (Files.exists(Path.of(realPath2))) {
            File storeFile = new File(realPath2);
            boolean erased = storeFile.delete();
            System.out.print(erased);
        }
        part.write(realPath + "/" + "main.jpg");

        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String rawpwd = request.getParameter("newPassword");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        int userID =  Integer.parseInt(request.getParameter("id"));
        User user = UserModel.findByUserId(userID);
        if(user != null){
            User u = new User(userID , user.getPermission() , user.getCode() , user.getUsername() , bcryptHashString , user.getName() , user.getEmail() , user.getDob() , user.getMoney() , user.getMoneyAu() , user.getAddress() , user.getPhone() );
            UserModel.update(u);
        }
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updateBank(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String inputBank = request.getParameter("inputBank");
        String idBank = request.getParameter("idBank");
        int userID =  Integer.parseInt(request.getParameter("id"));
        Bank b = new Bank(userID , inputBank , idBank);
        BankModel.add(b);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID =  Integer.parseInt(request.getParameter("id"));
        int idB =  Integer.parseInt(request.getParameter("idB"));
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
        if(user != null){
            User u = new User(userID , user.getPermission() , user.getCode() , user.getUsername() , user.getPassword() , name , email , dob , user.getMoney() , user.getMoneyAu() , address , phone );
            UserModel.update(u);
        }
        if( inputBank != null && idBank != null){
            Bank b = new Bank(idB ,userID , inputBank , idBank);
            BankModel.update(b);
        }
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID =  Integer.parseInt(request.getParameter("idUser"));
        UserModel.delete(userID);
        String url = request.getHeader("referer");
        ServletUtils.redirect(url, request, response);
    }

    private void updatePermission(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userID =  Integer.parseInt(request.getParameter("idUser"));
        int permission = Integer.parseInt(request.getParameter("permission"));
        User user = new User(userID , permission);
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
        String codeString = codeInt1.concat(codeInt2).concat(codeInt3).concat(codeInt4).concat(codeInt5).concat(codeInt6);
        int codeInt =  Integer.parseInt(codeString);
        User user = UserModel.findByCode(codeInt);
        if(user == null){
            request.setAttribute("hasError", true); //Thông báo lỗi
            request.setAttribute("errorMessage", "Sai mã OTP"); // Thông báo lỗi
            ServletUtils.forward("/views/vwAccount/Otp.jsp", request, response);
        }else{
            int id = user.getId();
            int permission = 3;
            int code = 1;
            String bcryptHashString = user.getPassword();
            LocalDate Dob = user.getDob();
            String username = user.getUsername();
            String name = user.getName();
            String email = user.getEmail();
            String address = user.getAddress();
            String phone = user.getPhone();
            User User = new User(id , permission, code , username, bcryptHashString, name, email, Dob , 0 , 0 , address , phone );
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
                errorString = "Captcha invalid!";
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
            prop.put("mail.smtp.host" , "smtp.gmail.com");
            prop.put("mail.smtp.port" , "587");
            prop.put("mail.smtp.auth" , "true");
            prop.put("mail.smtp.starttls.enable" , "true");
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
            }catch (Exception e){

            }
            int permission = 4;
            User user = new User(permission, code , username, bcryptHashString, name, email, Dob , 0 ,0 , address , phone);
            UserModel.add(user);
            HttpSession session = request.getSession(); //Dùng chung cho mọi request
            session.setAttribute("otp", true); //Bật quyền vào trang OTP
            ServletUtils.redirect("/Account/Otp?email="+ email, request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        if(email == null){
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User user = UserModel.findByUsername(username);

            if (user != null ) {
                if(user.getPermission() != 4){
                    int id = user.getId();
                    String ID = String.valueOf(id);
                    BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                    if (result.verified) {
                        HttpSession session = request.getSession(); //Dùng chung cho mọi request
                        session.setAttribute("auth", true);
                        session.setAttribute("authUser", user);

//                Lưu account lên trân cookie

                        Cookie userID = new Cookie("_userid" , ID );
                        userID.setMaxAge(60*60*24*365);
                        userID.setPath("/");
                        response.addCookie(userID);
                        String url;
                        if(user.getPermission() == 0){
                            url = "/Admin";
                        }else {
                            url = "/Home";
                        }
                        ServletUtils.redirect(url, request, response);

                    } else {
                        request.setAttribute("hasError", true); //Thông báo lỗi
                        request.setAttribute("errorMessage", "Invalid login."); // Thông báo lỗi
                        ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                    }
                }
                else {
                    request.setAttribute("hasError", true); //Thông báo lỗi
                    request.setAttribute("errorMessage", "Invalid login."); // Thông báo lỗi
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }
            } else {
                request.setAttribute("hasError", true); //Thông báo lỗi
                request.setAttribute("errorMessage", "Invalid login."); // Thông báo lỗi
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        }else {
                //Note: tạo riêng một class java gửi Email rồi gọi nó ra.
                final String usernameEmail = "19110186@student.hcmute.edu.vn";
                final String passwordEmail = "Tao?may2cau";
                String emailSubject = "Forget Password";
                String emailContent = "http://localhost:8080/Webapp_TLCN/Account/ForgetPassword?email="+ usernameEmail;

                Properties prop = new Properties();
                prop.put("mail.smtp.host" , "smtp.gmail.com");
                prop.put("mail.smtp.port" , "587");
                prop.put("mail.smtp.auth" , "true");
                prop.put("mail.smtp.starttls.enable" , "true");
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
                }catch (Exception e){

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

