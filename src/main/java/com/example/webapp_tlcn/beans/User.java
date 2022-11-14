package com.example.webapp_tlcn.beans;

import java.time.LocalDate;

public class User {
    //0:Admin
    //1:Nguoi ban
    //2:Người ban can xác nhận
    //3:Người mua
    //4:Người mua can xac nhan
    private int id , permission , code , money , moneyAu;
    private String username , password , name , email , address, phone;
    private LocalDate dob;

    public User() {
    }


    public User(int id, int permission, int code, String username, String password, String name, String email, LocalDate dob, int money, int moneyAu , String address, String phone) {
        this.id = id;
        this.permission = permission;
        this.code = code;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.money = money;
        this.moneyAu = moneyAu;
        this.address = address;
        this.phone = phone;
    }

    public User(int permission, int code ,String username, String password, String name, String email, LocalDate dob, int money , int moneyAu , String address, String phone) {
        this.id = -1;
        this.permission = permission;
        this.code = code;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.money= money;
        this.moneyAu = moneyAu;
        this.address = address;
        this.phone = phone;
    }

    public User(int id, int money, int moneyAu) {
        this.id = id;
        this.money = money;
        this.moneyAu = moneyAu;
    }

    public User(int id, int permission) {
        this.id = id;
        this.permission = permission;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public int getCode() {
        return code;
    }

    public int getPermission() {
        return permission;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public LocalDate getDob() {
        return dob;
    }

    public int getMoney() {
        return money;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMoneyAu() {
        return moneyAu;
    }
}
