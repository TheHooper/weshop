package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.CouponCats;

public interface CouponCatsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CouponCats record);

    int insertSelective(CouponCats record);

    CouponCats selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CouponCats record);

    int updateByPrimaryKey(CouponCats record);
}