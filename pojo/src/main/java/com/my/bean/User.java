package com.my.bean;

public class User {
    private Integer id;

    private String account;

    private String password;

    private UserData userData;

    private String state;

    public User(Integer id, String account, String password, UserData userData, String state) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.userData = userData;
        this.state = state;
    }

    public User(Integer id, String account, String password, String state) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.state = state;
    }

    public User(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public User() {
        super();
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public UserData getUserData() {
        return userData;
    }

    public void setUserData(UserData userData) {
        this.userData = userData;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}