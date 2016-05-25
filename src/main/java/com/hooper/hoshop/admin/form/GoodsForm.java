package com.hooper.hoshop.admin.form;

import com.hooper.hoshop.dto.Goods.GoodsAttrVo;
import com.hooper.hoshop.entity.*;

import java.util.List;

/**
 * Created by 47123 on 2016/5/17.
 */
public class GoodsForm {

    private Goods goods;

    private GoodsCat goodsCat;

    private List<GoodsAttr> goodsAttrs;

    private List<GoodsSku> goodsSkus;

    private GoodsDetail goodsDetail;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public List<GoodsAttr> getGoodsAttrs() {
        return goodsAttrs;
    }

    public void setGoodsAttrs(List<GoodsAttr> goodsAttrs) {
        this.goodsAttrs = goodsAttrs;
    }

    public GoodsCat getGoodsCat() {
        return goodsCat;
    }

    public void setGoodsCat(GoodsCat goodsCat) {
        this.goodsCat = goodsCat;
    }

    public GoodsDetail getGoodsDetail() {
        return goodsDetail;
    }

    public void setGoodsDetail(GoodsDetail goodsDetail) {
        this.goodsDetail = goodsDetail;
    }

    public List<GoodsSku> getGoodsSkus() {
        return goodsSkus;
    }

    public void setGoodsSkus(List<GoodsSku> goodsSkus) {
        this.goodsSkus = goodsSkus;
    }
}
