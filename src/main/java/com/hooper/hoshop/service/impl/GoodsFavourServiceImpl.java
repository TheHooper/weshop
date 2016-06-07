package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.GoodsFavourMapper;
import com.hooper.hoshop.entity.Goods;
import com.hooper.hoshop.entity.GoodsFavour;
import com.hooper.hoshop.service.facade.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/6/7.
 */
@Service
public class GoodsFavourServiceImpl implements GenericService<GoodsFavour, Integer> {

    @Autowired
    GoodsFavourMapper goodsFavourMapper;

    @Override
    public int insert(GoodsFavour goodsFavour) {
        goodsFavour.setcTime(System.currentTimeMillis());
        return goodsFavourMapper.insert(goodsFavour);
    }

    @Override
    public int update(GoodsFavour goodsFavour) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return goodsFavourMapper.deleteByPrimaryKey(id);
    }

    public int delete(int userId, int goodsId) {
        return goodsFavourMapper.deleteByGoodsIdAndUserId(userId, goodsId);
    }

    @Override
    public GoodsFavour selectById(Integer id) {
        return null;
    }

    @Override
    public List<GoodsFavour> selectList() {
        return null;
    }

    public GoodsFavour selectByUserIdAndGoods(int userId, int goodsId) {
        return goodsFavourMapper.selectByUserIdAndGoods(userId, goodsId);
    }

    public List<Goods> selectFavourByUserId(int userId, int offset, int limit) {
        List<Goods> result = null;
        try {
            result = goodsFavourMapper.selectPagedByUser(userId, offset, limit);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Goods>() : result;
        return result;
    }
}
