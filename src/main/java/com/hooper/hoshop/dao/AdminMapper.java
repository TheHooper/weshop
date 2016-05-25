package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Admin;


public interface AdminMapper extends GenericDao<Admin, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectByName(String name);
}