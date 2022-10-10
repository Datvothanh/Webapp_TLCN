package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class Product {
    private int ProID, StartingPrice, CatID, StepPrice, HighestPaidPrice, UserID ,Sell , CountAuction ,UserSellID, Top;
    private String ProName, TinyDes, FullDes;
    private LocalDateTime EndDay;

    public Product() {

    }

    public Product(int proID, int countAuction) {
        ProID = proID;
        CountAuction = countAuction;
    }

    public Product(int proID, int highestPaidPrice, int userID , int countAuction , int top) {
        ProID = proID;
        HighestPaidPrice = highestPaidPrice;
        UserID = userID;
        CountAuction = countAuction;
        Top = top;
    }

    public Product(int proID, int startingPrice, int catID, int stepPrice, int highestPaidPrice,  String proName, String tinyDes, String fullDes, LocalDateTime endDay, int top) {
        ProID = proID;
        StartingPrice = startingPrice;
        CatID = catID;
        StepPrice = stepPrice;
        HighestPaidPrice = highestPaidPrice;
        ProName = proName;
        TinyDes = tinyDes;
        FullDes = fullDes;
        EndDay = endDay;
        Top = top;
    }

    public Product(int startingPrice, int catID, int stepPrice, int highestPaidPrice,  int userID, int sell,int countAuction ,int userSellID, String proName, String tinyDes, String fullDes, LocalDateTime endDay, int top) {
        ProID = -1;
        StartingPrice = startingPrice;
        CatID = catID;
        StepPrice = stepPrice;
        HighestPaidPrice = highestPaidPrice;
        UserID = userID;
        Sell = sell;
        CountAuction = countAuction;
        UserSellID = userSellID;
        ProName = proName;
        TinyDes = tinyDes;
        FullDes = fullDes;
        EndDay = endDay;
        Top = top;
    }

    public int getUserSellID() {
        return UserSellID;
    }

    public int getCountAuction() {
        return CountAuction;
    }

    public int getProID() {
        return ProID;
    }

    public int getStartingPrice() {
        return StartingPrice;
    }

    public int getCatID() {
        return CatID;
    }

    public int getStepPrice() {
        return StepPrice;
    }

    public int getHighestPaidPrice() {
        return HighestPaidPrice;
    }

    public String getProName() {
        return ProName;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }


    public LocalDateTime getEndDay() {
        return EndDay;
    }

    public int getUserID() {
        return UserID;
    }

    public int getSell() {
        return Sell;
    }

    public int getTop() {
        return Top;
    }
}
