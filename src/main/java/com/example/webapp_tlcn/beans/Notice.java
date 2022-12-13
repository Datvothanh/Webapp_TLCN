package com.example.webapp_tlcn.beans;

import java.time.LocalDateTime;

public class Notice {
    private int id , idUser , type , Price , Stt , idPro;
    protected  String notice ;
    private LocalDateTime DateEnd;

    public Notice() {
    }

    public Notice(int idUser, String notice, int type , LocalDateTime dateEnd , int price , int stt , int idPro) {
        this.id = -1;
        this.idUser = idUser;
        this.notice = notice;
        this.type = type;
        this.DateEnd = dateEnd;
        this.Price = price;
        this.Stt = stt;
        this.idPro = idPro;
    }

    public Notice(int id, int idUser, String notice, int type , LocalDateTime dateEnd , int price , int stt , int idPro) {
        this.id = id;
        this.idUser = idUser;
        this.notice = notice;
        this.type = type;
        this.DateEnd = dateEnd;
        this.Price = price;
        this.Stt = stt;
        this.idPro = idPro;
    }

    public int getIdPro() {
        return idPro;
    }

    public void setIdPro(int idPro) {
        this.idPro = idPro;
    }

    public int getStt() {
        return Stt;
    }

    public void setStt(int stt) {
        Stt = stt;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public LocalDateTime getDateEnd() {
        return DateEnd;
    }

    public void setDateEnd(LocalDateTime dateEnd) {
        DateEnd = dateEnd;
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

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
