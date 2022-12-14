package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {
    public static List<Product> findAll(int zero) {
        final String query = "select * from products where Sell =:zero AND `Delete` = 0";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("zero", zero)
                    .executeAndFetch(Product.class);
        }
    }


    //Admin
    public static void add(Product p) {
        String Sql = "INSERT INTO products (ProID ,ProName, StartingPrice, CatID, TinyDes, FullDes, StepPrice, HighestPaidPrice, EndDay,UserID,Sell,CountAuction,UserSellID,Top,Ship,Year,Month,Day,Hour,Minute,Second, `Delete` , Paid , StrDate) VALUES (:ProID,:ProName,:StartingPrice,:CatID,:TinyDes,:FullDes,:StepPrice,:HighestPaidPrice,:EndDay,:UserID,:Sell,:CountAuction,:UserSellID,:Top,:Ship,:Year,:Month,:Day,:Hour,:Minute,:Second, :Delete , :Paid , :StrDate) ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProName", p.getProName())
                    .addParameter("StartingPrice", p.getStartingPrice())
                    .addParameter("CatID", p.getCatID())
                    .addParameter("TinyDes", p.getTinyDes())
                    .addParameter("FullDes", p.getFullDes())
                    .addParameter("StepPrice", p.getStepPrice())
                    .addParameter("HighestPaidPrice", p.getHighestPaidPrice())
                    .addParameter("EndDay", p.getEndDay())
                    .addParameter("UserID", p.getUserID())
                    .addParameter("Sell", p.getSell())
                    .addParameter("CountAuction", p.getCountAuction())
                    .addParameter("UserSellID", p.getUserSellID())
                    .addParameter("Top", p.getTop())
                    .addParameter("Ship", p.getShip())
                    .addParameter("ProID", p.getProID())
                    .addParameter("Year", p.getYear())
                    .addParameter("Month", p.getMonth())
                    .addParameter("Day", p.getDay())
                    .addParameter("Hour", p.getHour())
                    .addParameter("Minute", p.getMinute())
                    .addParameter("Second", p.getSecond())
                    .addParameter("Delete", p.getDelete())
                    .addParameter("Paid", p.getPaid())
                    .addParameter("StrDate", p.getStrDate())
                    .executeUpdate();
        }
    }

    public static List<Product> findByTextSearch (String txtSr , int zero) {
        final String query = "SELECT * FROM products WHERE ProName LIKE :txtSr and Sell =:zero  AND `Delete` = 0";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("txtSr",txtSr)
                    .addParameter("zero",zero)
                    .executeAndFetch(Product.class);
        }
    }

    public static Product findById(int id) {
        final String query = "select * from products where ProID =:ProID  AND `Delete` = 0";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("ProID", id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void update(Product p) {
        String Sql = "UPDATE products SET  ProName = :ProName, StartingPrice = :StartingPrice, CatID = :CatID, TinyDes = :TinyDes, FullDes = :FullDes, StepPrice = :StepPrice, HighestPaidPrice = :HighestPaidPrice, EndDay = :EndDay , Top = :Top , `Delete` = :Delete , Paid = :Paid , StrDate = :StrDate WHERE ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProName", p.getProName())
                    .addParameter("StartingPrice", p.getStartingPrice())
                    .addParameter("CatID", p.getCatID())
                    .addParameter("TinyDes", p.getTinyDes())
                    .addParameter("FullDes", p.getFullDes())
                    .addParameter("StepPrice", p.getStepPrice())
                    .addParameter("HighestPaidPrice", p.getHighestPaidPrice())
                    .addParameter("EndDay", p.getEndDay())
                    .addParameter("ProID", p.getProID())
                    .addParameter("Top", p.getTop())
                    .addParameter("Delete", p.getDelete())
                    .addParameter("Paid", p.getPaid())
                    .addParameter("StrDate", p.getStrDate())
                    .executeUpdate();
        }
    }

    public static void updateShip(Product p) {
        String Sql = "UPDATE products SET  Ship =:Ship WHERE ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", p.getProID())
                    .addParameter("Ship", p.getShip())
                    .executeUpdate();
        }
    }

    public static void updateHighestPaidPrice(Product p) {
        String Sql = "UPDATE products SET  HighestPaidPrice = :HighestPaidPrice , UserID = :UserID , CountAuction =:CountAuction , Top =:Top WHERE ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("HighestPaidPrice", p.getHighestPaidPrice())
                    .addParameter("UserID", p.getUserID())
                    .addParameter("CountAuction",p.getCountAuction())
                    .addParameter("ProID", p.getProID())
                    .addParameter("Top", p.getTop())
                    .executeUpdate();
        }
    }

//    public static void updateCountAuction(Product p) {
//        String Sql = "UPDATE products SET  CountAuction =:CountAuction WHERE ProID = :ProID";
//        try (Connection con = DbUtils.getConnection()) {
//            con.createQuery(Sql)
//                    .addParameter("CountAuction",p.getCountAuction())
//                    .addParameter("ProID", p.getProID())
//                    .executeUpdate();
//        }
//    }

    public static void delete(int id) {
        String Sql = "DELETE from products where ProID = :ProID";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("ProID", id)
                    .executeUpdate();
        }
    }

    //End
    //User
    public static List<Product> findByCatID(int catId , int zero) {
        final String query = "select * from products where CatID =:CatID and Sell =:zero  AND `Delete` = 0";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("CatID", catId)
                    .addParameter("zero", zero)
                    .executeAndFetch(Product.class);
        }
    }
    //End

    public static List<Product> findTop5HighestPrice() {
        final String query = "SELECT * FROM products where Sell = 0  AND `Delete` = 0 order by Top desc limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findTop5End() {
        final String query = "SELECT * FROM products where Sell = 0  AND `Delete` = 0 order by EndDay asc limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findTop5HighestCountAuction() {
        final String query = "SELECT * FROM products where Sell = 0  AND `Delete` = 0 order by CountAuction desc limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> findByCatID5(int catId , int proId) {
        final String query = "select * from products where CatID =:CatID AND Sell = 0  AND `Delete` = 0 AND NOT ProID =:ProID limit 5";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("CatID", catId)
                    .addParameter("ProID", proId)
                    .executeAndFetch(Product.class);
        }
    }

    public static Product ProEnd() {
        final String query = "SELECT * FROM products ORDER BY ProID desc LIMIT 1";
        try (Connection con = DbUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

}


