package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Areas;

import java.util.List;

public interface AreasMapper extends GenericDao<Areas, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Areas record);

    int insertSelective(Areas record);

    Areas selectByPrimaryKey(Integer id);

    List<Areas> selectByCitiesId(Integer id);

    int updateByPrimaryKeySelective(Areas record);

    int updateByPrimaryKey(Areas record);
}