package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Role;

public interface RoleMapper extends GenericDao<Role, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}