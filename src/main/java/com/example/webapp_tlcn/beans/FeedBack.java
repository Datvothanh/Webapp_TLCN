package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class FeedBack {
    private int FbID , ProID , UserFbID, UserSellID , Happy;
    private String FeedBack;

    public FeedBack(int proID, int userFbID,int userSellID ,int happy, String feedBack) {
        FbID = -1;
        ProID = proID;
        UserFbID = userFbID;
        UserSellID = userSellID;
        Happy = happy;
        FeedBack = feedBack;
    }

    public int getFbID() {
        return FbID;
    }

    public void setFbID(int fbID) {
        FbID = fbID;
    }

    public int getUserFbID() {
        return UserFbID;
    }

    public void setUserFbID(int userFbID) {
        UserFbID = userFbID;
    }

    public int getUserSellID() {
        return UserSellID;
    }

    public void setUserSellID(int userDellID) {
        UserSellID = userDellID;
    }

    public int getProID() {
        return ProID;
    }

    public void setProID(int proID) {
        ProID = proID;
    }

    public int getHappy() {
        return Happy;
    }

    public void setHappy(int happy) {
        Happy = happy;
    }

    public String getFeedBack() {
        return FeedBack;
    }

    public void setFeedBack(String feedBack) {
        FeedBack = feedBack;
    }
}
