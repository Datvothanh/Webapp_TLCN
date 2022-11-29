package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.ListBank;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ListBankModel {
    public static List<ListBank> findAll() {
        final String query = "select * from listbanks";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ListBank.class);
        }
    }

    public static void add(ListBank l) {
        String Sql = "INSERT INTO listbanks (name) VALUES (:name)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("name", l.getName())
                    .executeUpdate();
        }
    }
}
