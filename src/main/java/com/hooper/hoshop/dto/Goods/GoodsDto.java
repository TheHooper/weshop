package com.hooper.hoshop.dto.Goods;

import java.math.BigDecimal;

/**
 * Created by 47123 on 2016/5/19.
 */
public class GoodsDto {

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

    private String cTime;

    private String uTime;

    private Integer catsId;

    public Integer getCatsId() {
        return catsId;
    }

    public void setCatsId(Integer catsId) {
        this.catsId = catsId;
    }

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }

    public BigDecimal getdCharge() {
        return dCharge;
    }

    public void setdCharge(BigDecimal dCharge) {
        this.dCharge = dCharge;
    }

    public Integer getDetailId() {
        return detailId;
    }

    public void setDetailId(Integer detailId) {
        this.detailId = detailId;
    }

    public String getGoodsListPic() {
        return goodsListPic;
    }

    public void setGoodsListPic(String goodsListPic) {
        this.goodsListPic = goodsListPic;
    }

    public String getGoodsMainPic() {
        return goodsMainPic;
    }

    public void setGoodsMainPic(String goodsMainPic) {
        this.goodsMainPic = goodsMainPic;
    }

    public String getGoodsSecondPic() {
        return goodsSecondPic;
    }

    public void setGoodsSecondPic(String goodsSecondPic) {
        this.goodsSecondPic = goodsSecondPic;
    }

    public String getGoodsThirthPic() {
        return goodsThirthPic;
    }

    public void setGoodsThirthPic(String goodsThirthPic) {
        this.goodsThirthPic = goodsThirthPic;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public BigDecimal getoPrice() {
        return oPrice;
    }

    public void setoPrice(BigDecimal oPrice) {
        this.oPrice = oPrice;
    }

    public Integer getOrginalNum() {
        return orginalNum;
    }

    public void setOrginalNum(Integer orginalNum) {
        this.orginalNum = orginalNum;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getSaledNum() {
        return saledNum;
    }

    public void setSaledNum(Integer saledNum) {
        this.saledNum = saledNum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getuTime() {
        return uTime;
    }

    public void setuTime(String uTime) {
        this.uTime = uTime;
    }
}
