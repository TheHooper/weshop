package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.rate.RateGoodsVo;
import com.hooper.hoshop.dto.rate.RateUserVo;
import com.hooper.hoshop.entity.Rate;

import java.util.List;
import java.util.Map;

public interface RateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Rate record);

    int insertSelective(Rate record);

    Rate selectByPrimaryKey(Integer id);

    List<RateUserVo> selectListPaged(Map map);

    int countListPaged(Map map);

    List<RateGoodsVo> selectByFilter(Map map);

    int countByFilter(Map map);

    int updateByPrimaryKeySelective(Rate record);

    int updateByPrimaryKey(Rate record);
}