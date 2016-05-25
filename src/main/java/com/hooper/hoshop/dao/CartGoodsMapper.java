package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.CartGoods;

import java.util.List;

public interface CartGoodsMapper extends GenericDao<CartGoods, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(CartGoods record);

    int insertSelective(CartGoods record);

    CartGoods selectByPrimaryKey(Integer id);

    List<CartGoods> selectByUserId(Integer id);

    int updateByPrimaryKeySelective(CartGoods record);

    int updateByPrimaryKey(CartGoods record);
}