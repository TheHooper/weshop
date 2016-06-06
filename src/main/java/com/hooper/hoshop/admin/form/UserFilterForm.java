package com.hooper.hoshop.admin.form;

/**
 * Created by 47123 on 2016/6/5.
 */
public class UserFilterForm {

    private String name;

    private String mobile;

    private Integer orderType;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }
}
