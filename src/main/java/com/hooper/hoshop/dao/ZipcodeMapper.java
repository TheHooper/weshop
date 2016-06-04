package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Zipcode;

public interface ZipcodeMapper extends GenericDao<Zipcode, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Zipcode record);

    int insertSelective(Zipcode record);

    Zipcode selectByPrimaryKey(Integer id);

    Zipcode selectByAreaId(Integer id);

    int updateByPrimaryKeySelective(Zipcode record);

    int updateByPrimaryKey(Zipcode record);
}