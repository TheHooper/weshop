package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.GoodsSku;

import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
public interface GoodsSkuService extends GenericService<GoodsSku, String> {

    public GoodsSku selectBySkuId(Integer goodsId, List<Integer> attrIds);

}
