package com.example.webapp_tlcn.beans;

public class Bank {
    private int id , idUser ;
    private  String bank , idBank;


    public Bank() {

    }

    public Bank(int idUser, String bank, String idBank) {
        this.id = -1;
        this.idUser = idUser;
        this.bank = bank;
        this.idBank = idBank;
    }

    public Bank(int id, int idUser, String bank, String idBank) {
        this.id = id;
        this.idUser = idUser;
        this.bank = bank;
        this.idBank = idBank;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getIdBank() {
        return idBank;
    }

    public void setIdBank(String idBank) {
        this.idBank = idBank;
    }
}
