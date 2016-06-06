package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.CouponCats;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CouponCatsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CouponCats record);

    int insertSelective(CouponCats record);

    CouponCats selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CouponCats record);

    int updateByPrimaryKey(CouponCats record);

    List<CouponCats> selectByCouponId(@Param("id") Integer id);
}