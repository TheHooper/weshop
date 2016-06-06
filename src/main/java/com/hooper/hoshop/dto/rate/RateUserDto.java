package com.hooper.hoshop.dto.rate;

/**
 * Created by 47123 on 2016/6/6.
 */
public class RateUserDto extends RateGoodsVo {

    private String userName;
    private String mobile;
    private String cTimeStr;

    public String getcTimeStr() {
        return cTimeStr;
    }

    public void setcTimeStr(String cTimeStr) {
        this.cTimeStr = cTimeStr;
    }

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
