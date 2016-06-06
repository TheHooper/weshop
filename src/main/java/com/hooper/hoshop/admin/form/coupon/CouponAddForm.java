package com.hooper.hoshop.admin.form.coupon;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

/**
 * Created by 47123 on 2016/6/5.
 */
public class CouponAddForm {

    private String title;

    private BigDecimal price;

    private Integer num;

    private Integer[] parentCatsId;

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

    public Integer[] getParentCatsId() {
        return parentCatsId;
    }

    public void setParentCatsId(Integer[] parentCatsId) {
        this.parentCatsId = parentCatsId;
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

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("CouponAddForm{");
        sb.append("limitDays=").append(limitDays);
        sb.append(", title='").append(title).append('\'');
        sb.append(", price=").append(price);
        sb.append(", num=").append(num);
        sb.append(", parentCatsId=").append(Arrays.toString(parentCatsId));
        sb.append(", threshold=").append(threshold);
        sb.append('}');
        return sb.toString();
    }
}
