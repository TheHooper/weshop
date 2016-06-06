package com.hooper.hoshop.dto.rate;

/**
 * Created by 47123 on 2016/6/6.
 */
public class RateUserVo extends RateGoodsVo {

    private String userName;
    private String mobile;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
