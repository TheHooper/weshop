package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.GoodsCat;

public interface GoodsCatMapper extends GenericDao<GoodsCat, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsCat record);

    int insertSelective(GoodsCat record);

    GoodsCat selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsCat record);

    int updateByPrimaryKey(GoodsCat record);

    GoodsCat selectByGoodsId(Integer goodsId);
}