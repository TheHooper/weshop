package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.rate.RateFilterForm;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.BeanToMapUtil;
import com.hooper.hoshop.dao.RateMapper;
import com.hooper.hoshop.dto.rate.RateGoodsVo;
import com.hooper.hoshop.dto.rate.RateUserVo;
import com.hooper.hoshop.entity.Rate;
import com.hooper.hoshop.service.facade.RateService;
import com.hooper.hoshop.web.form.rate.RateQueryForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by 47123 on 2016/6/4.
 */
@Service
public class RateServiceImpl implements RateService {

    @Autowired
    RateMapper rateMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void rateOrder(List<Rate> rateList) {
        boolean isDo = false;
        for (Rate rate : rateList) {
            rate.setIsDel(false);
            rate.setcTime(System.currentTimeMillis());
            rateMapper.insert(rate);
            isDo = true;
        }
        if (!isDo) {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "null rate list");
        }
    }

    @Override
    public List<RateUserVo> selectPaged(RateFilterForm rateFilterForm) {
        List<RateUserVo> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(rateFilterForm);
            result = rateMapper.selectListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<RateUserVo>() : result;
        return result;
    }

    @Override
    public int conutPaged(RateFilterForm rateFilterForm) {
        try {
            Map params = BeanToMapUtil.convertBean(rateFilterForm);
            return rateMapper.countListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public List<RateGoodsVo> selectByFilter(RateQueryForm rateQueryForm) {
        List<RateGoodsVo> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(rateQueryForm);
            result = rateMapper.selectByFilter(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<RateGoodsVo>() : result;
        return result;
    }

    @Override
    public int countByFilter(RateQueryForm rateQueryForm) {
        try {
            Map params = BeanToMapUtil.convertBean(rateQueryForm);
            return rateMapper.countByFilter(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public int insert(Rate rate) {
        return 0;
    }

    @Override
    public int update(Rate rate) {
        return rateMapper.updateByPrimaryKeySelective(rate);
    }

    @Override
    public int delete(Integer id) {
        Rate rate = rateMapper.selectByPrimaryKey(id);
        rate.setIsDel(true);
        return rateMapper.updateByPrimaryKey(rate);
    }

    @Override
    public Rate selectById(Integer id) {
        return null;
    }

    @Override
    public List<Rate> selectList() {
        return null;
    }
}
