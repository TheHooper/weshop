package com.hooper.hoshop.web.form.coupon;

/**
 * Created by 47123 on 2016/6/6.
 */
public class UserQueryCouponForm {

    private Integer userId;

    private Integer state;

    private Long time = System.currentTimeMillis();

    public Long getTime() {
        return time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
