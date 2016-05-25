package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.GoodsDetailMapper;
import com.hooper.hoshop.entity.GoodsDetail;
import com.hooper.hoshop.service.facade.GoodsDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
@Service
public class GoodsDetailServiceImpl implements GoodsDetailService {

    @Autowired
    GoodsDetailMapper goodsDetailMapper;

    @Override
    public int insert(GoodsDetail goodsDetail) {
        if (goodsDetail != null) {
            goodsDetail.setcTime(System.currentTimeMillis());
            goodsDetail.setIsDel(false);
            try {
                goodsDetailMapper.insert(goodsDetail);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int update(GoodsDetail goodsDetail) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public GoodsDetail selectById(Integer id) {
        GoodsDetail result = null;
        try {
            result = goodsDetailMapper.selectByPrimaryKey(id);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        return result;
    }

    @Override
    public List<GoodsDetail> selectList() {
        return null;
    }
}
