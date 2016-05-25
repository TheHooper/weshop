package com.hooper.hoshop.common.Enum;

/**
 * Created by 47123 on 2016/5/19.
 */
public enum OrderStateEnum {

    CARTS(-1, "购物车"), WAIT_PAY(0, "待付款"), WAIT_SHIP(1, "待发货"), WAIT_RECEIVE(2, "待收货"), WAIT_RATE(3, "待评价"),
    COMPLETED(4, "已完成"), CANCEL(5, "已取消");

    private int value;
    private String intro;

    OrderStateEnum(int value, String intro) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
