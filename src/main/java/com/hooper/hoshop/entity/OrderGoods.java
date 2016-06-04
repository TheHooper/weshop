package com.hooper.hoshop.entity;

import java.math.BigDecimal;

public class OrderGoods {
    private Integer id;

    private Integer goodsId;

    private Integer orderId;

    private String goodsPic;

    private String skuId;

    private Integer attrId;

    private Integer attrId1;

    private String salesAttr;

    private String goodsTitle;

    private BigDecimal oPrice;

    private BigDecimal price;

    private Integer num;

    private Long cTime;

    private Long dTime;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic == null ? null : goodsPic.trim();
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public Integer getAttrId() {
        return attrId;
    }

    public void setAttrId(Integer attrId) {
        this.attrId = attrId;
    }

    public Integer getAttrId1() {
        return attrId1;
    }

    public void setAttrId1(Integer attrId1) {
        this.attrId1 = attrId1;
    }

    public String getSalesAttr() {
        return salesAttr;
    }

    public void setSalesAttr(String salesAttr) {
        this.salesAttr = salesAttr == null ? null : salesAttr.trim();
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle == null ? null : goodsTitle.trim();
    }

    public BigDecimal getoPrice() {
        return oPrice;
    }

    public void setoPrice(BigDecimal oPrice) {
        this.oPrice = oPrice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }

    public Long getdTime() {
        return dTime;
    }

    public void setdTime(Long dTime) {
        this.dTime = dTime;
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}