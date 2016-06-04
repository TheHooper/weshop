package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.Rate;

import java.util.List;

/**
 * Created by 47123 on 2016/6/4.
 */
public interface RateService extends GenericService<Rate, Integer> {

    public void rateOrder(List<Rate> rateList);
}
