package com.hooper.hoshop.entity;

import java.math.BigDecimal;

public class Order {
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

    private Long cTime;

    private Long pTime;

    private String deliveryCom;

    private String deliveryNo;

    private Long deliveryTime;

    private Integer status;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

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

    public String getOrderPic() {
        return orderPic;
    }

    public void setOrderPic(String orderPic) {
        this.orderPic = orderPic == null ? null : orderPic.trim();
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
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

    public BigDecimal getrTotal() {
        return rTotal;
    }

    public void setrTotal(BigDecimal rTotal) {
        this.rTotal = rTotal;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }

    public Long getpTime() {
        return pTime;
    }

    public void setpTime(Long pTime) {
        this.pTime = pTime;
    }

    public String getDeliveryCom() {
        return deliveryCom;
    }

    public void setDeliveryCom(String deliveryCom) {
        this.deliveryCom = deliveryCom == null ? null : deliveryCom.trim();
    }

    public String getDeliveryNo() {
        return deliveryNo;
    }

    public void setDeliveryNo(String deliveryNo) {
        this.deliveryNo = deliveryNo == null ? null : deliveryNo.trim();
    }

    public Long getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(Long deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Order{");
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
        sb.append(", cTime=").append(cTime);
        sb.append(", pTime=").append(pTime);
        sb.append(", deliveryCom='").append(deliveryCom).append('\'');
        sb.append(", deliveryNo='").append(deliveryNo).append('\'');
        sb.append(", deliveryTime=").append(deliveryTime);
        sb.append(", status=").append(status);
        sb.append(", isDel=").append(isDel);
        sb.append('}');
        return sb.toString();
    }
}