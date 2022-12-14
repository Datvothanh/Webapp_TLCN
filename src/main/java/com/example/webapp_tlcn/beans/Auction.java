package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class Auction {
    private int AuID, UserID , ProID, Price , Paid;
    private LocalDateTime Date;
    private String StrDate ;

    public Auction(int auID, int userID, int proID, int price , int paid , LocalDateTime date , String strDate) {
        AuID = auID;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = paid;
        Date = date;
        StrDate = strDate;
    }

    public Auction(int auID, int paid) {
        AuID = auID;
        Paid = paid;
    }

    public Auction(int userID, int proID, int price , int paid , LocalDateTime date , String strDate) {
        AuID = -1;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = paid;
        Date = date;
        StrDate = strDate;
    }

    public int getAuID() {
        return AuID;
    }

    public int getUserID() {
        return UserID;
    }

    public int getProID() {
        return ProID;
    }

    public int getPrice() {
        return Price;
    }

    public int getPaid() {
        return Paid;
    }

    public LocalDateTime getDate() {
        return Date;
    }

    public void setAuID(int auID) {
        AuID = auID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public void setProID(int proID) {
        ProID = proID;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public void setPaid(int paid) {
        Paid = paid;
    }

    public void setDate(LocalDateTime date) {
        Date = date;
    }

    public String getStrDate() {
        return StrDate;
    }

    public void setStrDate(String strDate) {
        StrDate = strDate;
    }
}