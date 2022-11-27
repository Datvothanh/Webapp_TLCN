package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.Bank;
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
}
