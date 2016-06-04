package com.hooper.hoshop.web.form;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * Created by 47123 on 2016/6/3.
 */
public class OrderPayForm {

    @NotBlank(message = "请输入密码")
    private String password;

    @NotNull(message = "请选择地址")
    private Integer addressId;

    private Integer orderId;

    private Integer couponId;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
