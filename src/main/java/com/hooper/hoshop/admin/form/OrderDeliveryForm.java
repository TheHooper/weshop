package com.hooper.hoshop.admin.form;

/**
 * Created by 47123 on 2016/5/31.
 */
public class OrderDeliveryForm {

    private Integer orderId;

    private String deliveryCom;

    private String deliveryNo;

    public String getDeliveryCom() {
        return deliveryCom;
    }

    public void setDeliveryCom(String deliveryCom) {
        this.deliveryCom = deliveryCom;
    }

    public String getDeliveryNo() {
        return deliveryNo;
    }

    public void setDeliveryNo(String deliveryNo) {
        this.deliveryNo = deliveryNo;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}
