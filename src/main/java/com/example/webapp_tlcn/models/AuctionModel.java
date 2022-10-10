package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.Auction;
import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class AuctionModel {

    public static List<Auction> findAll() {
        final String query = "select * from auctions";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Auction.class);
        }
    }

    public static Auction findById(int id) {
        final String query = "select * from auctions where AuID =:AuID";
        try (Connection con = DbUtils.getConnection()) {
            List<Auction> list = con.createQuery(query)
                    .addParameter("AuID", id)
                    .executeAndFetch(Auction.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void add(Auction a) {
        String Sql = "INSERT INTO auctions (UserID, ProID, Price , Paid) VALUES (:UserID,:ProID,:Price,:Paid)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("UserID", a.getUserID())
                    .addParameter("ProID", a.getProID())
                    .addParameter("Price", a.getPrice())
                    .addParameter("Paid", a.getPaid())
                    .executeUpdate();
        }
    }

    public static void update(Auction a) {
        String Sql = "UPDATE auctions SET  UserID = :UserID, ProID = :ProID, Price = :Price , Paid =:Paid WHERE AuID = :AuID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("UserID", a.getUserID())
                    .addParameter("ProID", a.getProID())
                    .addParameter("Price", a.getPrice())
                    .addParameter("Paid", a.getPaid())
                    .addParameter("AuID" , a.getAuID())
                    .executeUpdate();
        }
    }

    public static void updatePaid(Auction a) {
        String Sql = "UPDATE auctions SET  Paid = :Paid WHERE AuID = :AuID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Paid", a.getPaid())
                    .addParameter("AuID" , a.getAuID())
                    .executeUpdate();
        }
    }

    public static int findUserIDProID (int UserID , int ProID) {
        final String query = "select * from auctions where UserID=:UserID AND ProID=:ProID";
        try (Connection con = DbUtils.getConnection()) {
            List<Auction> list = con.createQuery(query)
                    .addParameter("UserID", UserID)
                    .addParameter("ProID", ProID)
                    .executeAndFetch(Auction.class);
            if (list.size() == 0) {
                return -1;
            }
            return list.get(0).getAuID();
        }
    }

    public static int findSizeProID (int ProID) {
        final String query = "select * from auctions where ProID=:ProID";
        try (Connection con = DbUtils.getConnection()) {
            List<Auction> list = con.createQuery(query)
                    .addParameter("ProID", ProID)
                    .executeAndFetch(Auction.class);
            return list.size();
        }
    }


    public static List<Auction> findTopHighestPrice () {
        final String query = "SELECT * FROM auctions order by Price desc";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Auction.class);
        }
    }

    public static Auction findSecondHighestPrice (int ProID) {
        final String query = "SELECT * FROM auctions WHERE ProID=:ProID order by Price desc ";
        try (Connection con = DbUtils.getConnection()) {
            List<Auction> list = con.createQuery(query)
                    .addParameter("ProID", ProID)
                    .executeAndFetch(Auction.class);
            return list.get(1);
        }
    }

    public static void delete(int id) {
        String Sql = "DELETE from auctions where AuID = :AuID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("AuID", id)
                    .executeUpdate();
        }
    }

}

