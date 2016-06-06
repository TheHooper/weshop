package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.admin.form.rate.RateFilterForm;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.dto.rate.RateGoodsVo;
import com.hooper.hoshop.dto.rate.RateUserDto;
import com.hooper.hoshop.dto.rate.RateUserVo;
import com.hooper.hoshop.entity.Rate;
import com.hooper.hoshop.service.facade.RateService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 47123 on 2016/6/6.
 */
@Controller
@RequestMapping("admin/rate")
public class RateController {

    @Resource
    RateService rateService;

    @RequestMapping(value = "/rate")
    public String toView() {
        return "admin/rate/rate";
    }

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    DataTablePageOutput getCouponsDataTable(RateFilterForm rateFilterForm, DataTablePageForm pageForm) {
        int offset = pageForm.getStart() == null ? 0 : pageForm.getStart();
        int limit = pageForm.getLength() == null ? 10 : pageForm.getLength();
        rateFilterForm.setOffset(offset);
        rateFilterForm.setLimit(limit);
        List<RateUserVo> rateList = rateService.selectPaged(rateFilterForm);
        List<RateUserDto> dtos = new ArrayList<>();
        for (RateUserVo rateUserVo : rateList) {
            RateUserDto rateUserDto = new RateUserDto();
            BeanUtils.copyProperties(rateUserVo, rateUserDto);
            rateUserDto.setcTimeStr(DateUtil.getFormatDate(new Date(rateUserVo.getcTime()), WebConstant.TIME_FORMATTER));
            dtos.add(rateUserDto);
        }
        DataTablePageOutput output = new DataTablePageOutput();
        int count = rateService.conutPaged(rateFilterForm);
        output.setData(dtos);
        output.setRecordsFiltered(count);
        output.setRecordsTotal(count);
        return output;
    }

    @RequestMapping(value = "/update", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    JsonOutput update(Rate rate) {
        rateService.update(rate);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/del", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    JsonOutput del(Integer rateId) {
        rateService.delete(rateId);
        JsonOutput output = new JsonOutput();
        return output;
    }
}
