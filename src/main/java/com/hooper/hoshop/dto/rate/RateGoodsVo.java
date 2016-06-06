package com.hooper.hoshop.dto.rate;

import com.hooper.hoshop.entity.Rate;

import java.math.BigDecimal;

/**
 * Created by 47123 on 2016/6/6.
 */
public class RateGoodsVo extends Rate {

    private String goodsTitle;

    private String salesAttr;

    private String goodsPic;

    private BigDecimal price;

    private Integer num;

    private String timeStr;

    public String getTimeStr() {
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getSalesAttr() {
        return salesAttr;
    }

    public void setSalesAttr(String salesAttr) {
        this.salesAttr = salesAttr;
    }
}
