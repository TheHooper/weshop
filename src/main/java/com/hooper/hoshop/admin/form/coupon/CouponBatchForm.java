package com.hooper.hoshop.admin.form.coupon;

import java.util.List;

/**
 * Created by 47123 on 2016/6/5.
 */
public class CouponBatchForm {

    private Integer couponId;
    private Integer sendType;
    private Integer num;

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Integer getSendType() {
        return sendType;
    }

    public void setSendType(Integer sendType) {
        this.sendType = sendType;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
