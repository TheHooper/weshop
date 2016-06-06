package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.rate.RateFilterForm;
import com.hooper.hoshop.dto.rate.RateGoodsVo;
import com.hooper.hoshop.dto.rate.RateUserVo;
import com.hooper.hoshop.entity.Rate;
import com.hooper.hoshop.web.form.rate.RateQueryForm;

import java.util.List;

/**
 * Created by 47123 on 2016/6/4.
 */
public interface RateService extends GenericService<Rate, Integer> {

    public void rateOrder(List<Rate> rateList);

    public List<RateUserVo> selectPaged(RateFilterForm rateFilterForm);

    public int conutPaged(RateFilterForm rateFilterForm);

    public List<RateGoodsVo> selectByFilter(RateQueryForm rateQueryForm);

    public int countByFilter(RateQueryForm rateQueryForm);
}
