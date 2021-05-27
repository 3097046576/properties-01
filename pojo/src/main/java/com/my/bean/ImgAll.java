package com.my.bean;

public class ImgAll {
    private String data;
    private Integer user_id;

    @Override
    public String toString() {
        return "ImgAll{" +
                "data='" + data + '\'' +
                ", user_id=" + user_id +
                '}';
    }

    public ImgAll() {
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public ImgAll(String data, Integer user_id) {
        this.data = data;
        this.user_id = user_id;
    }
}
