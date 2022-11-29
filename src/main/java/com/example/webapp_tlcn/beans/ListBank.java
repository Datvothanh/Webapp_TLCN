package com.example.webapp_tlcn.beans;

public class ListBank {
    int id;
    String name;

    public ListBank() {
    }

    public ListBank(String name) {
        this.id = -1;
        this.name = name;
    }
    public ListBank(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
