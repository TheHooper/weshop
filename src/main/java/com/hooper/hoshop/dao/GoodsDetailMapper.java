package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.GoodsDetail;

public interface GoodsDetailMapper extends GenericDao<GoodsDetail, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsDetail record);

    int insertSelective(GoodsDetail record);

    GoodsDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsDetail record);

    int updateByPrimaryKey(GoodsDetail record);

    GoodsDetail selectByGoodsId(Integer goodsId);
}