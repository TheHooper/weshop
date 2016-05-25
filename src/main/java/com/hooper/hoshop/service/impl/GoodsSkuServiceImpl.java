package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.SkuIdUtil;
import com.hooper.hoshop.dao.GoodsSkuMapper;
import com.hooper.hoshop.entity.GoodsSku;
import com.hooper.hoshop.service.facade.GoodsSkuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/16.
 */
@Service
public class GoodsSkuServiceImpl implements GoodsSkuService {

    @Autowired
    GoodsSkuMapper goodsSkuMapper;

    @Override
    public int insert(GoodsSku goodsSku) {
        return 0;
    }

    @Override
    public int update(GoodsSku goodsSku) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    @Override
    public GoodsSku selectById(String id) {
        return null;
    }

    @Override
    public List<GoodsSku> selectList() {
        return null;
    }

    @Override
    public GoodsSku selectBySkuId(Integer goodsId, List<Integer> attrIds) {
        if (goodsId != null && attrIds != null) {
            Map params = new HashMap();
            params.put("goodsId", goodsId);
            if (attrIds.size() > 1) {
                String skuId1 = SkuIdUtil.getSkuId(attrIds.get(0), attrIds.get(1));
                String skuId2 = SkuIdUtil.getSkuId(attrIds.get(1), attrIds.get(0));
                params.put("skuId1", skuId1);
                params.put("skuId2", skuId2);
            } else {
                String skuId1 = SkuIdUtil.getSkuId(attrIds.get(0));
                params.put("skuId1", skuId1);
            }
            try {
                return goodsSkuMapper.selectBySkuIdAndGoodsId(params);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "mysql op failed " + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "没有获取到必要参数 null param error！");
        }
    }
}
