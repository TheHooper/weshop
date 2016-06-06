package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.GoodsForm;
import com.hooper.hoshop.admin.form.GoodsSelectorForm;
import com.hooper.hoshop.dto.goods.GoodsAttrVo;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.web.form.GoodsFilterForm;

import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
public interface GoodsService extends GenericService<Goods, Integer> {

    public void addGoods(GoodsForm goodsForm);

    public void updateGoods(GoodsForm goodsForm);

    public List<Goods> selectListPaged(GoodsSelectorForm goodsSelectorForm, Integer offset, Integer limit);

    public int countListPaged(GoodsSelectorForm goodsSelectorForm);

    public List<GoodsSku> selectGoodsSkuByGoodsId(Integer goodsId);

    public List<GoodsAttrVo> selectGoodsAttrByGoodsId(Integer goodsId);

    public GoodsDetail selectGoodsDetailByGoodsId(Integer goodsId);

    public GoodsCat selectGoodsCatByGoodsId(Integer goodsId);

    public void changeGoodsStatus(Integer goodsId, Integer status);

    public List<Goods> selectListWithoutPulloff(GoodsFilterForm goodsFilterForm);

    public int countList(GoodsFilterForm filterForm);
}
