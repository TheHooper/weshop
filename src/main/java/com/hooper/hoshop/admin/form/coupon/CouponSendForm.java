package com.hooper.hoshop.admin.form.coupon;

import java.util.List;

/**
 * Created by 47123 on 2016/6/5.
 */
public class CouponSendForm {

    private Integer couponId;

    private List<Integer> userIds;


    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public List<Integer> getUserIds() {
        return userIds;
    }

    public void setUserIds(List<Integer> userIds) {
        this.userIds = userIds;
    }
}
