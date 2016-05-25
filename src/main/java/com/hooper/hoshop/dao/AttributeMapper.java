package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Attribute;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttributeMapper extends GenericDao<Attribute, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Attribute record);

    int insertSelective(Attribute record);

    Attribute selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attribute record);

    int updateByPrimaryKey(Attribute record);

    List<Attribute> selectParents();

    List<Attribute> selectChildren(@Param(value = "parentId") Integer parentId);
}