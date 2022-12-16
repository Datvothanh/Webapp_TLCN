package com.example.webapp_tlcn.models;

import com.example.webapp_tlcn.beans.User;
import com.example.webapp_tlcn.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {

    public static List<User> findAll() {
        final String query = "select * from users where not permission = 0 and not permission = 4";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
        }
    }

    public static void add(User u) {
        String Sql = "INSERT INTO users (username, password, name, email, dob, permission , code, money, moneyAu, address , phone) VALUES (:username,:password,:name,:email,:dob,:permission,:code, :money , :moneyAu, :address , :phone)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("username", u.getUsername())
                    .addParameter("password",u.getPassword())
                    .addParameter("name", u.getName())
                    .addParameter("email",u.getEmail())
                    .addParameter("dob",u.getDob())
                    .addParameter("permission",u.getPermission())
                    .addParameter("code" , u.getCode() )
                    .addParameter("money" , u.getMoney() )
                    .addParameter("moneyAu", u.getMoneyAu())
                    .addParameter("address", u.getAddress())
                    .addParameter("phone", u.getPhone())
                    .executeUpdate();
        }
    }

    public static User findByUsername(String username) {
        final String query = "select * from users where username=:username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static User findByUsernameNotAccount(String username) {
        final String query = "select * from users where username=:username and not permission = 4";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);
            if (list.size() == 0 ) {
                return null;
            }

            return list.get(0);
        }
    }

    public static User findByEmailNotAccount(String email) {
        final String query = "select * from users where email=:email and not permission = 4";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);
            if (list.size() == 0 || list.size() == 1) {
                return null;
            } else {
                return list.get(0);
            }

        }
    }

    public static User findByUserId(Integer id) {
        final String query = "select * from users where id=:id";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static User findByEmail(String email) {
        final String query = "select * from users where email=:email";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static User findByCode(int code) {
        final String query = "select * from users where code=:code";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("code", code)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void update(User u) {
        String Sql = "UPDATE users SET  Username = :Username, Password = :Password, Name = :Name, Email = :Email, Dob = :Dob, Permission = :Permission , Code = :Code , money =:Money , moneyAu =:MoneyAu , address =:Address, phone =:Phone WHERE Id = :Id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Username", u.getUsername())
                    .addParameter("Password", u.getPassword())
                    .addParameter("Name", u.getName())
                    .addParameter("Email", u.getEmail())
                    .addParameter("Dob", u.getDob())
                    .addParameter("Permission", u.getPermission())
                    .addParameter("Code" , u.getCode())
                    .addParameter("Id", u.getId())
                    .addParameter("Money", u.getMoney())
                    .addParameter("MoneyAu", u.getMoneyAu())
                    .addParameter("Address", u.getAddress())
                    .addParameter("Phone", u.getPhone())
                    .executeUpdate();
        }
    }

    public static void updateMoney(User u) {
        String Sql = "UPDATE users SET money =:Money , moneyAu =:MoneyAu WHERE Id = :Id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Id", u.getId())
                    .addParameter("Money", u.getMoney())
                    .addParameter("MoneyAu", u.getMoneyAu())
                    .executeUpdate();
        }
    }

    public static void updatePermission(User u) {
        String Sql = "UPDATE users SET Permission = :Permission WHERE Id = :Id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("Permission", u.getPermission())
                    .addParameter("Id", u.getId())
                    .executeUpdate();
        }
    }

    public static void delete(int id) {
        String Sql = "DELETE from users where id = :id";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
}