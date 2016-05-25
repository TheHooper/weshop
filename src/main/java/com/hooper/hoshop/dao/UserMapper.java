package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.User;

public interface UserMapper extends GenericDao<User, Integer> {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByMobile(String mobile);

    User selectByName(String name);
}