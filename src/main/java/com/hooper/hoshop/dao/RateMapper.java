package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Rate;

public interface RateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Rate record);

    int insertSelective(Rate record);

    Rate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Rate record);

    int updateByPrimaryKey(Rate record);
}