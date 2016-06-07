package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Goods;
import com.hooper.hoshop.entity.GoodsFavour;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsFavourMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByGoodsIdAndUserId(@Param("userId") Integer userId, @Param("goodsId") Integer goodsId);

    int insert(GoodsFavour record);

    int insertSelective(GoodsFavour record);

    GoodsFavour selectByPrimaryKey(Integer id);

    GoodsFavour selectByUserIdAndGoods(@Param("userId") Integer userId, @Param("goodsId") Integer goodsId);

    List<Goods> selectPagedByUser(@Param("userId") Integer userId, @Param("offset") Integer offset, @Param("limit") Integer limit);

    int updateByPrimaryKeySelective(GoodsFavour record);

    int updateByPrimaryKey(GoodsFavour record);
}