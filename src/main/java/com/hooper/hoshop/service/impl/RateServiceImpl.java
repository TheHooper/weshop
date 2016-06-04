package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.RateMapper;
import com.hooper.hoshop.entity.Rate;
import com.hooper.hoshop.service.facade.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
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
    public int insert(Rate rate) {
        return 0;
    }

    @Override
    public int update(Rate rate) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
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
