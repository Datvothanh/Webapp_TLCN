package com.example.webapp_tlcn.tools;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class tools {
    public static void main(String[] args) throws Exception {

    }

    public static String maskString(String strText, int start, int end, char maskChar)
            throws Exception{

        if(strText == null || strText.equals(""))
            return "";

        if(start < 0)
            start = 0;

        if( end > strText.length() )
            end = strText.length();

        if(start > end)
            throw new Exception("End index cannot be greater than start index");

        int maskLength = end - start;

        if(maskLength == 0)
            return strText;

        StringBuilder sbMaskString = new StringBuilder(maskLength);

        for(int i = 0; i < maskLength; i++){
            sbMaskString.append(maskChar);
        }

        return strText.substring(0, start)
                + sbMaskString.toString()
                + strText.substring(start + maskLength);
    }

    public static void email(String email,String emailSubject ,String emailContent) {

        final String usernameEmail = "19110186@student.hcmute.edu.vn";
        final String passwordEmail = "Tao?may2cau";

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
}

