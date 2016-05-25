package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.OrderGoods;

public interface OrderGoodsMapper extends GenericDao<OrderGoods, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderGoods record);

    int insertSelective(OrderGoods record);

    OrderGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderGoods record);

    int updateByPrimaryKey(OrderGoods record);
}