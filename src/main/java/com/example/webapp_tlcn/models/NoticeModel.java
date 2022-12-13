package com.example.webapp_tlcn.models;


import com.example.webapp_tlcn.beans.Notice;
import com.example.webapp_tlcn.beans.Product;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class NoticeModel {
    public static List<Notice> findAll() {
        final String query = "select * from notices";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Notice.class);
        }
    }

    public static void add(Notice n) {
        String Sql = "INSERT into notices (notice, type, idUser, dateEnd , price , stt , idPro) VALUES (:Notice , :Type , :IdUser , :DateEnd, :Price , :Stt , :IdPro)  ";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Notice",n.getNotice())
                    .addParameter("Type",n.getType())
                    .addParameter("IdUser",n.getIdUser())
                    .addParameter("DateEnd",n.getDateEnd())
                    .addParameter("Price",n.getPrice())
                    .addParameter("Stt",n.getStt())
                    .addParameter("IdPro", n.getIdPro())
                    .executeUpdate();
        }
    }

    public static void update(Notice n) {
        String Sql = "UPDATE notices SET notice = :Notice , type = :Type , idUser = :IdUser , dateEnd = :DateEnd, price = :Price , notice = :Notice  , stt = :Stt ,idPro = :IdPro WHERE id = :Id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Notice", n.getNotice())
                    .addParameter("Id", n.getId())
                    .addParameter("Type", n.getType())
                    .addParameter("IdUser", n.getIdUser())
                    .addParameter("DateEnd", n.getDateEnd())
                    .addParameter("Price", n.getPrice())
                    .addParameter("Stt", n.getStt())
                    .addParameter("IdPro", n.getIdPro())
                    .executeUpdate();
        }
    }
}
