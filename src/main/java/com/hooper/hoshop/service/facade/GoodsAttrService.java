package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.dto.Goods.GoodsAttrVo;
import com.hooper.hoshop.entity.GoodsAttr;

import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
public interface GoodsAttrService extends GenericService<GoodsAttr, Integer> {

    public List<GoodsAttrVo> selectVoListByGoodsId(int goodsId);
}
