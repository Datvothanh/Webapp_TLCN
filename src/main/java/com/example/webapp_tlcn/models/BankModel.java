package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.Bank;
import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class BankModel {

    public static List<Bank> findAll() {
        final String query = "select * from banks";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Bank.class);
        }
    }

    public static void add(Bank b) {
        String Sql = "INSERT INTO banks (idUser, bank, idBank) VALUES (:idUser , :bank , :idBank)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("idUser", b.getIdUser())
                    .addParameter("bank", b.getBank())
                    .addParameter("idBank", b.getIdBank())
                    .executeUpdate();
        }
    }

    public static void update(Bank b) {
        String Sql = "UPDATE banks SET  idUser = :idUser, bank = :bank, idBank = :idBank  WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("idUser", b.getIdUser())
                    .addParameter("bank", b.getBank())
                    .addParameter("idBank", b.getIdBank())
                    .addParameter("id", b.getId())
                    .executeUpdate();
        }
    }
}
