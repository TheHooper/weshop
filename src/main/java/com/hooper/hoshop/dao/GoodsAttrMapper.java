package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.goods.GoodsAttrVo;
import com.hooper.hoshop.entity.GoodsAttr;

import java.util.List;

public interface GoodsAttrMapper extends GenericDao<GoodsAttr, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodsAttr record);

    int insertSelective(GoodsAttr record);

    GoodsAttr selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsAttr record);

    int updateByPrimaryKey(GoodsAttr record);

    List<GoodsAttrVo> selectVoListByGoodsId(Integer goodsId);

    int insertOrUpdate(GoodsAttr record);
}