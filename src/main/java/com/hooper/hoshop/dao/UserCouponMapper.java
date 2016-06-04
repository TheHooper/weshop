package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.UserCoupon;

public interface UserCouponMapper extends GenericDao<UserCoupon, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(UserCoupon record);

    int insertSelective(UserCoupon record);

    UserCoupon selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserCoupon record);

    int updateByPrimaryKey(UserCoupon record);
}