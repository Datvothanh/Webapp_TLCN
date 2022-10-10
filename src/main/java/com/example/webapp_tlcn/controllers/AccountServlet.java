package com.example.webapp_tlcn.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.webapp_tlcn.beans.Auction;
import com.example.webapp_tlcn.beans.Favourite;
import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.models.AuctionModel;
import com.example.webapp_tlcn.models.FavouriteModel;
import com.example.webapp_tlcn.models.ProductModel;
import com.example.webapp_tlcn.models.UserModel;
import com.example.webapp_tlcn.recaptcha.VerifyUtils;
import com.example.webapp_tlcn.utils.ServletUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Properties;
import java.util.Random;


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
                ServletUtils.forward("/views/vwAccount/Otp.jsp" , request , response);
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
                List<User> userList = UserModel.findAll();
                request.setAttribute("userList" , userList);
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            case "/WatchList":
                List<Product> listAll = ProductModel.findAll(0);
                List<Favourite> listFavourite = FavouriteModel.findAll();
                request.setAttribute("productAll", listAll);
                request.setAttribute("favourite", listFavourite);
                ServletUtils.forward("/views/vwAccount/WatchList.jsp", request, response);
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
                request.setAttribute("productAll", ListAllSucces);
                request.setAttribute("listAuction", ListAuction);
                ServletUtils.forward("/views/vwAccount/SuccessList.jsp", request, response);
                break;
            case "/SellingList":
                List<Product> list = ProductModel.findAll(0 );
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwAccount/SellingList.jsp", request, response);
                break;
            case "/EndingList":
                List<Product> List = ProductModel.findAll(1 );
                List<Auction> Auction = AuctionModel.findAll();
                request.setAttribute("products", List);
                request.setAttribute("listAuction", Auction);
                ServletUtils.forward("/views/vwAccount/EndList.jsp", request, response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("user");
                User user = UserModel.findByUsername(username);
                boolean isAvailable = (user == null);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(isAvailable);
                out.flush();
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
            case "/UpdatePermission":
                updatePermission(request,response);
                break;
            case "/Otp":
                otpUser(request,response);
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
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

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
        String codeString = request.getParameter("code");
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
            User User = new User(id , permission, code , username, bcryptHashString, name, email, Dob , 0 , 0);
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
            final String passwordEmail = "Dat123456789";
            String emailSubject = "Mã OTP";
            String emailContent = String.valueOf(numberRandom);

            Properties prop = new Properties();
            prop.put("mail.smtp.host" , "smtp.gmail.com");
            prop.put("mail.smtp.port" , "587");
            prop.put("mail.smtp.auth" , "true");
            prop.put("mail.smtp.starttls.enable" , "true");
            Session sessionEmail = Session.getInstance(prop, new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(usernameEmail, passwordEmail);
                }
            });
            //Đăng nhập được email
            try {
                Message message = new MimeMessage(sessionEmail);
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
            User user = new User(permission, code , username, bcryptHashString, name, email, Dob , 0 ,0);
            UserModel.add(user);
            HttpSession session = request.getSession(); //Dùng chung cho mọi request
            session.setAttribute("otp", true); //Bật quyền vào trang OTP
            ServletUtils.redirect("/Account/Otp", request, response);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

                    String url = "/Home";
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

