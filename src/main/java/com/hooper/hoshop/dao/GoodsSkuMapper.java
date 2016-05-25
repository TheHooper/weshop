package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.GoodsSku;

import java.util.List;
import java.util.Map;

public interface GoodsSkuMapper extends GenericDao<GoodsSku, String> {
    int deleteByPrimaryKey(String id);

    int insert(GoodsSku record);

    int insertSelective(GoodsSku record);

    GoodsSku selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(GoodsSku record);

    int updateByPrimaryKey(GoodsSku record);

    List<GoodsSku> selectByGoodsId(Integer goodsId);

    int insertOrUpdate(GoodsSku record);

    GoodsSku selectBySkuIdAndGoodsId(Map map);
}