package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.GoodsAttrMapper;
import com.hooper.hoshop.dto.Goods.GoodsAttrVo;
import com.hooper.hoshop.entity.GoodsAttr;
import com.hooper.hoshop.service.facade.GoodsAttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
@Service
public class GoodsAttrServiceImpl implements GoodsAttrService {

    @Autowired
    GoodsAttrMapper goodsAttrMapper;

    @Override
    public int insert(GoodsAttr goodsAttr) {
        if (goodsAttr != null) {
            try {
                goodsAttrMapper.insert(goodsAttr);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int update(GoodsAttr goodsAttr) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public GoodsAttr selectById(Integer id) {
        return null;
    }

    @Override
    public List<GoodsAttr> selectList() {
        return null;
    }

    @Override
    public List<GoodsAttrVo> selectVoListByGoodsId(int goodsId) {
        List<GoodsAttrVo> result = null;
        try {
            result = goodsAttrMapper.selectVoListByGoodsId(goodsId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<GoodsAttrVo>() : result;
        return result;
    }
}
