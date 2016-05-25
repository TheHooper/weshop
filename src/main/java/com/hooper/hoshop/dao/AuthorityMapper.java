package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Authority;

public interface AuthorityMapper extends GenericDao<Authority, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Authority record);

    int insertSelective(Authority record);

    Authority selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Authority record);

    int updateByPrimaryKey(Authority record);
}