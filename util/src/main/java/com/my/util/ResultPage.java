package com.my.util;

public class ResultPage<Type> {

    String news;

    Type judge;

    public ResultPage(String news,Type judge) {
        this.news = news;
        this.judge = judge;
    }
    public ResultPage(String news) {
        this.news = news;
    }

    public Type getJudge() {
        return judge;
    }

    public void setJudge(Type judge) {
        this.judge = judge;
    }

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
    }
}