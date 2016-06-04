package com.hooper.hoshop.web.form;

/**
 * Created by 47123 on 2016/5/27.
 */
public class GoodsCheckoutForm {

    private Integer goodsId;

    private String skuId;

    private String salesAttr;

    private Integer num;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
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

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GoodsCheckoutForm{");
        sb.append("goodsId=").append(goodsId);
        sb.append(", skuId='").append(skuId).append('\'');
        sb.append(", salesAttr='").append(salesAttr).append('\'');
        sb.append(", num=").append(num);
        sb.append('}');
        return sb.toString();
    }
}
