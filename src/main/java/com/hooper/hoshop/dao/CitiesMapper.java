package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Cities;

import java.util.List;

public interface CitiesMapper extends GenericDao<Cities, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Cities record);

    int insertSelective(Cities record);

    Cities selectByPrimaryKey(Integer id);

    List<Cities> selectByProvincesId(Integer id);

    int updateByPrimaryKeySelective(Cities record);

    int updateByPrimaryKey(Cities record);
}