package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Coupon;

import java.util.List;
import java.util.Map;

public interface CouponMapper extends GenericDao<Coupon, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Coupon record);

    int insertSelective(Coupon record);

    Coupon selectByPrimaryKey(Integer id);

    List<Coupon> selectListPaged(Map param);

    int countListPaged(Map param);

    int updateByPrimaryKeySelective(Coupon record);

    int updateByPrimaryKey(Coupon record);
}