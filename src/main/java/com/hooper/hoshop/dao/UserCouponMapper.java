package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.coupon.UserCouponDto;
import com.hooper.hoshop.entity.UserCoupon;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserCouponMapper extends GenericDao<UserCoupon, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(UserCoupon record);

    int insertSelective(UserCoupon record);

    UserCoupon selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserCoupon record);

    int updateByPrimaryKey(UserCoupon record);

    UserCouponDto selectDtoById(@Param("id") Integer id);

    List<UserCouponDto> selectByFilter(Map map);

    int countByFilter(Map map);
}