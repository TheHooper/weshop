package com.hooper.hoshop.web.form;

import javax.validation.constraints.NotNull;

/**
 * Created by 47123 on 2016/5/25.
 */
public class CartModifyForm {
    @NotNull(message = "获取CartId出错")
    private Integer id;

    private Integer goodsId;

    private String goodsPic;

    private String skuId;

    private String salesAttr;

    private String goodsTitle;

    private Integer num;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getSalesAttr() {
        return salesAttr;
    }

    public void setSalesAttr(String salesAttr) {
        this.salesAttr = salesAttr;
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId;
    }
}
