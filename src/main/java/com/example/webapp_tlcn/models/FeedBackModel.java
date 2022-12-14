package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.FeedBack;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class FeedBackModel {
    public static List<FeedBack> findAll() {
        final String query = "select * from feedbacks ";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(FeedBack.class);
        }
    }


    public static void add(FeedBack f) {
        String Sql = "INSERT INTO feedbacks (ProID,UserFbID,UserSellID,FeedBack,Happy,Date,StrDate) VALUES (:ProID , :UserFbID , :UserSellID,:FeedBack , :Happy , :Date , :StrDate)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID",f.getProID() )
                    .addParameter("UserFbID",f.getUserFbID() )
                    .addParameter("UserSellID",f.getUserSellID() )
                    .addParameter("FeedBack",f.getFeedBack() )
                    .addParameter("Happy",f.getHappy())
                    .addParameter("Date",f.getDate())
                    .addParameter("StrDate",f.getStrDate())
                    .executeUpdate();
        }
    }


}
