package com.hooper.hoshop.entity;

import java.math.BigDecimal;

public class Coupon {
    private Integer id;

    private String title;

    private BigDecimal price;

    private Integer num;

    private String legalGoodsCat;

    private Integer limitDays;

    private BigDecimal threshold;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getLegalGoodsCat() {
        return legalGoodsCat;
    }

    public void setLegalGoodsCat(String legalGoodsCat) {
        this.legalGoodsCat = legalGoodsCat == null ? null : legalGoodsCat.trim();
    }

    public Integer getLimitDays() {
        return limitDays;
    }

    public void setLimitDays(Integer limitDays) {
        this.limitDays = limitDays;
    }

    public BigDecimal getThreshold() {
        return threshold;
    }

    public void setThreshold(BigDecimal threshold) {
        this.threshold = threshold;
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}