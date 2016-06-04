package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Provinces;

import java.util.List;

public interface ProvincesMapper extends GenericDao<Provinces, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Provinces record);

    int insertSelective(Provinces record);

    Provinces selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Provinces record);

    int updateByPrimaryKey(Provinces record);

    List<Provinces> selectAll();
}