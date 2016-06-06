package com.hooper.hoshop.dto.order;

import com.hooper.hoshop.entity.*;

import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
public class OrderDetailOutput {

    private User user;

    private Order order;

    private Address address;

    private Coupon coupon;

    private List<OrderGoods> orderGoodses;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderGoods> getOrderGoodses() {
        return orderGoodses;
    }

    public void setOrderGoodses(List<OrderGoods> orderGoodses) {
        this.orderGoodses = orderGoodses;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
