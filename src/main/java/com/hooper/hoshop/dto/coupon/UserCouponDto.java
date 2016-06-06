package com.hooper.hoshop.dto.coupon;

import com.hooper.hoshop.entity.Coupon;
import com.hooper.hoshop.entity.UserCoupon;

import java.math.BigDecimal;

/**
 * Created by 47123 on 2016/6/6.
 */
public class UserCouponDto extends UserCoupon {

    private String title;

    private BigDecimal price;

    private Integer num;

    private Integer limitDays;

    private BigDecimal threshold;

    public Integer getLimitDays() {
        return limitDays;
    }

    public void setLimitDays(Integer limitDays) {
        this.limitDays = limitDays;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getThreshold() {
        return threshold;
    }

    public void setThreshold(BigDecimal threshold) {
        this.threshold = threshold;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
