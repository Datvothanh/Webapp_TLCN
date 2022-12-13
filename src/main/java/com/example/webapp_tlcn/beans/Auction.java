package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class Auction {
    private int AuID, UserID , ProID, Price , Paid;
    private LocalDateTime Date;

    public Auction(int auID, int userID, int proID, int price , int paid , LocalDateTime date) {
        AuID = auID;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = paid;
        Date = date;
    }

    public Auction(int auID, int paid) {
        AuID = auID;
        Paid = paid;
    }

    public Auction(int userID, int proID, int price , int paid , LocalDateTime date ) {
        AuID = -1;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = paid;
        Date = date;
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
}