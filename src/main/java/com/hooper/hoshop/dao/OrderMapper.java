package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderMapper extends GenericDao<Order, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    List<Order> selectOrderByFilter(Map map);

    int countOrderByFilter(Map map);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Integer countCostByTime(@Param("startTime") long startTime, @Param("endTime") long endTime);

    Integer countNumByTime(@Param("startTime") long startTime, @Param("endTime") long endTime);
}