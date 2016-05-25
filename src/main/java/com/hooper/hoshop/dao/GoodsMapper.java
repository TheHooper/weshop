package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.Goods.GoodsCatVo;
import com.hooper.hoshop.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GoodsMapper extends GenericDao<Goods, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    List<Goods> selectListPaged(Map params);

    int countListPaged(Map params);

    List<Goods> selectListPagedWithoutPulloff(Map params);

    int countListPagedWithoutPulloff(Map params);
}