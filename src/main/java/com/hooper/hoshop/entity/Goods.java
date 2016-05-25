package com.hooper.hoshop.entity;

import java.math.BigDecimal;

public class Goods {
    private Integer id;

    private String title;

    private String intro;

    private String goodsListPic;

    private String goodsMainPic;

    private String goodsSecondPic;

    private String goodsThirthPic;

    private BigDecimal price;

    private BigDecimal oPrice;

    private BigDecimal dCharge;

    private Integer status;

    private Integer orginalNum;

    private Integer stock;

    private Integer saledNum;

    private Integer detailId;

    private Long cTime;

    private Long uTime;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getGoodsListPic() {
        return goodsListPic;
    }

    public void setGoodsListPic(String goodsListPic) {
        this.goodsListPic = goodsListPic == null ? null : goodsListPic.trim();
    }

    public String getGoodsMainPic() {
        return goodsMainPic;
    }

    public void setGoodsMainPic(String goodsMainPic) {
        this.goodsMainPic = goodsMainPic == null ? null : goodsMainPic.trim();
    }

    public String getGoodsSecondPic() {
        return goodsSecondPic;
    }

    public void setGoodsSecondPic(String goodsSecondPic) {
        this.goodsSecondPic = goodsSecondPic == null ? null : goodsSecondPic.trim();
    }

    public String getGoodsThirthPic() {
        return goodsThirthPic;
    }

    public void setGoodsThirthPic(String goodsThirthPic) {
        this.goodsThirthPic = goodsThirthPic == null ? null : goodsThirthPic.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getoPrice() {
        return oPrice;
    }

    public void setoPrice(BigDecimal oPrice) {
        this.oPrice = oPrice;
    }

    public BigDecimal getdCharge() {
        return dCharge;
    }

    public void setdCharge(BigDecimal dCharge) {
        this.dCharge = dCharge;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getOrginalNum() {
        return orginalNum;
    }

    public void setOrginalNum(Integer orginalNum) {
        this.orginalNum = orginalNum;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getSaledNum() {
        return saledNum;
    }

    public void setSaledNum(Integer saledNum) {
        this.saledNum = saledNum;
    }

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(Integer detailId) {
        this.detailId = detailId;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }

    public Long getuTime() {
        return uTime;
    }

    public void setuTime(Long uTime) {
        this.uTime = uTime;
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Goods{");
        sb.append("cTime=").append(cTime);
        sb.append(", dCharge=").append(dCharge);
        sb.append(", goodsListPic='").append(goodsListPic).append('\'');
        sb.append(", detailId=").append(detailId);
        sb.append(", goodsMainPic='").append(goodsMainPic).append('\'');
        sb.append(", goodsSecondPic='").append(goodsSecondPic).append('\'');
        sb.append(", goodsThirthPic='").append(goodsThirthPic).append('\'');
        sb.append(", id=").append(id);
        sb.append(", intro='").append(intro).append('\'');
        sb.append(", oPrice=").append(oPrice);
        sb.append(", orginalNum=").append(orginalNum);
        sb.append(", price=").append(price);
        sb.append(", saledNum=").append(saledNum);
        sb.append(", status=").append(status);
        sb.append(", title='").append(title).append('\'');
        sb.append(", stock=").append(stock);
        sb.append(", uTime=").append(uTime);
        sb.append('}');
        return sb.toString();
    }
}