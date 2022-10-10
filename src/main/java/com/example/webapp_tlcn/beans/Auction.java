package com.example.webapp_tlcn.beans;

public class Auction {
    int AuID, UserID , ProID, Price , Paid ;

    public Auction(int auID, int userID, int proID, int price , int paid) {
        AuID = auID;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = paid;
    }

    public Auction(int auID, int paid) {
        AuID = auID;
        Paid = paid;
    }

    public Auction(int userID, int proID, int price , int Paid) {
        AuID = -1;
        UserID = userID;
        ProID = proID;
        Price = price;
        Paid = Paid;
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
}