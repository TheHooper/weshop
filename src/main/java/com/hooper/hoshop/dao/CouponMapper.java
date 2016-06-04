package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Coupon;

public interface CouponMapper extends GenericDao<Coupon, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Coupon record);

    int insertSelective(Coupon record);

    Coupon selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Coupon record);

    int updateByPrimaryKey(Coupon record);
}