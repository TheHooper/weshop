package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.UserScore;

public interface UserScoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserScore record);

    int insertSelective(UserScore record);

    UserScore selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserScore record);

    int updateByPrimaryKeyWithBLOBs(UserScore record);

    int updateByPrimaryKey(UserScore record);
}