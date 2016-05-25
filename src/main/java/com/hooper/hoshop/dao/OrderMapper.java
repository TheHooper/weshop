package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Order;

public interface OrderMapper extends GenericDao<Order, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}