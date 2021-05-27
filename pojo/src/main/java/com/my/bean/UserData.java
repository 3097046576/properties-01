package com.my.bean;

public class UserData {
    private Integer id;

    private String name;

    private Integer age;

    private String telephone;

    private String eMail;

    private Integer accData;

    public UserData(Integer id, String name, Integer age, String telephone, String eMail, Integer accData) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.telephone = telephone;
        this.eMail = eMail;
        this.accData = accData;
    }

    public UserData() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail == null ? null : eMail.trim();
    }

    public Integer getAccData() {
        return accData;
    }

    public void setAccData(Integer accData) {
        this.accData = accData;
    }
}