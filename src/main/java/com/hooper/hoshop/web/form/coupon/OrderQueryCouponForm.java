package com.hooper.hoshop.web.form.coupon;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by 47123 on 2016/6/6.
 */
public class OrderQueryCouponForm {

    private BigDecimal total;

    private List<Integer> goodsIds;

    public List<Integer> getGoodsIds() {
        return goodsIds;
    }

    public void setGoodsIds(List<Integer> goodsIds) {
        this.goodsIds = goodsIds;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
