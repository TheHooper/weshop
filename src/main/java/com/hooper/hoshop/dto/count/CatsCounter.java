package com.hooper.hoshop.dto.count;

/**
 * Created by 47123 on 2016/6/6.
 */
public class CatsCounter {

    private Integer cats;
    private String catsName;
    private Integer counter;

    public Integer getCats() {
        return cats;
    }

    public void setCats(Integer cats) {
        this.cats = cats;
    }

    public String getCatsName() {
        return catsName;
    }

    public void setCatsName(String catsName) {
        this.catsName = catsName;
    }

    public Integer getCounter() {
        return counter;
    }

    public void setCounter(Integer counter) {
        this.counter = counter;
    }
}
