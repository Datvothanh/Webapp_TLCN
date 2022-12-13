package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class Product {
    private int ProID, StartingPrice, CatID, StepPrice, HighestPaidPrice, UserID ,Sell , CountAuction ,UserSellID, Top , Ship;
    private String ProName, TinyDes, FullDes;
    private LocalDateTime EndDay;
    private int Year , Month , Day , Hour , Minute , Second , Delete , Paid;

    public Product() {

    }

    public Product(int proID, int ship) {
        ProID = proID;
        Ship = ship;
    }

    public Product(int proID, int highestPaidPrice, int userID , int countAuction , int top) {
        ProID = proID;
        HighestPaidPrice = highestPaidPrice;
        UserID = userID;
        CountAuction = countAuction;
        Top = top;
    }

    public Product(int proID, int startingPrice, int catID, int stepPrice, int highestPaidPrice,  String proName, String tinyDes, String fullDes, LocalDateTime endDay, int top, int year , int month , int day , int hour , int minute , int second, int delete , int paid) {
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
        Year = year;
        Month = month;
        Day = day;
        Hour = hour;
        Minute = minute;
        Second = second;
        Delete = delete;
        Paid = paid;
    }

    public Product(int proID , int startingPrice, int catID, int stepPrice, int highestPaidPrice,  int userID, int sell,int countAuction ,int userSellID, String proName, String tinyDes, String fullDes, LocalDateTime endDay, int top, int ship , int year , int month , int day , int hour , int minute , int second , int delete , int paid)  {
        ProID = proID;
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
        Ship = ship;
        Year = year;
        Month = month;
        Day = day;
        Hour = hour;
        Minute = minute;
        Second = second;
        Delete = delete;
        Paid = paid;
    }

    public int getPaid() {
        return Paid;
    }

    public void setPaid(int paid) {
        Paid = paid;
    }

    public int getDelete() {
        return Delete;
    }

    public void setDelete(int delete) {
        Delete = delete;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int year) {
        Year = year;
    }

    public int getMonth() {
        return Month;
    }

    public void setMonth(int month) {
        Month = month;
    }

    public int getDay() {
        return Day;
    }

    public void setDay(int day) {
        Day = day;
    }

    public int getHour() {
        return Hour;
    }

    public void setHour(int hour) {
        Hour = hour;
    }

    public int getMinute() {
        return Minute;
    }

    public void setMinute(int minute) {
        Minute = minute;
    }

    public int getSecond() {
        return Second;
    }

    public void setSecond(int second) {
        Second = second;
    }

    public int getShip() {
        return Ship;
    }

    public void setShip(int ship) {
        Ship = ship;
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
