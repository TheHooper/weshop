package com.hooper.hoshop.dto.Order;

import java.math.BigDecimal;

/**
 * Created by 47123 on 2016/6/2.
 */
public class OrderDto {

    private Integer id;

    private String sn;

    private Integer userId;

    private Integer addressId;

    private Integer couponsId;

    private String orderPic;

    private Integer goodsNum;

    private BigDecimal total;

    private BigDecimal totalAndDelivery;

    private BigDecimal rTotal;

    private String cTime;

    private String pTime;

    private String deliveryCom;

    private String deliveryNo;

    private String deliveryTime;

    private Integer status;

    private String statusStr;

    private Boolean isDel;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getCouponsId() {
        return couponsId;
    }

    public void setCouponsId(Integer couponsId) {
        this.couponsId = couponsId;
    }

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }

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

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getDel() {
        return isDel;
    }

    public void setDel(Boolean del) {
        isDel = del;
    }

    public String getOrderPic() {
        return orderPic;
    }

    public void setOrderPic(String orderPic) {
        this.orderPic = orderPic;
    }

    public String getpTime() {
        return pTime;
    }

    public void setpTime(String pTime) {
        this.pTime = pTime;
    }

    public BigDecimal getrTotal() {
        return rTotal;
    }

    public void setrTotal(BigDecimal rTotal) {
        this.rTotal = rTotal;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusStr() {
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getTotalAndDelivery() {
        return totalAndDelivery;
    }

    public void setTotalAndDelivery(BigDecimal totalAndDelivery) {
        this.totalAndDelivery = totalAndDelivery;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OrderDto{");
        sb.append("addressId=").append(addressId);
        sb.append(", id=").append(id);
        sb.append(", sn='").append(sn).append('\'');
        sb.append(", userId=").append(userId);
        sb.append(", couponsId=").append(couponsId);
        sb.append(", orderPic='").append(orderPic).append('\'');
        sb.append(", goodsNum=").append(goodsNum);
        sb.append(", total=").append(total);
        sb.append(", totalAndDelivery=").append(totalAndDelivery);
        sb.append(", rTotal=").append(rTotal);
        sb.append(", cTime='").append(cTime).append('\'');
        sb.append(", pTime='").append(pTime).append('\'');
        sb.append(", deliveryCom='").append(deliveryCom).append('\'');
        sb.append(", deliveryNo='").append(deliveryNo).append('\'');
        sb.append(", deliveryTime='").append(deliveryTime).append('\'');
        sb.append(", status=").append(status);
        sb.append(", statusStr='").append(statusStr).append('\'');
        sb.append(", isDel=").append(isDel);
        sb.append('}');
        return sb.toString();
    }
}
