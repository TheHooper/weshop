package com.hooper.hoshop.web.controller;

/**
 * Created by 47123 on 2016/6/6.
 */

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.rate.RateGoodsVo;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.RateService;
import com.hooper.hoshop.web.form.rate.RateQueryForm;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/rate")
public class WebRateController {

    @Resource
    RateService rateService;

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<RateGoodsVo> getRates(RateQueryForm rateQueryForm) {
        List<RateGoodsVo> rateList = rateService.selectByFilter(rateQueryForm);
        for (RateGoodsVo rateUserVo : rateList) {
            rateUserVo.setTimeStr(DateUtil.getFormatDate(new Date(rateUserVo.getcTime()), WebConstant.TIME_FORMATTER));
        }
        return rateList;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/user", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<RateGoodsVo> getRatesByUser(RateQueryForm rateQueryForm, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        rateQueryForm.setUserId(user.getId());
        List<RateGoodsVo> rateList = rateService.selectByFilter(rateQueryForm);
        for (RateGoodsVo rateUserVo : rateList) {
            rateUserVo.setTimeStr(DateUtil.getFormatDate(new Date(rateUserVo.getcTime()), WebConstant.TIME_FORMATTER));
        }
        return rateList;
    }


    @RequestMapping(value = "/counter", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    Map countRate(RateQueryForm rateQueryForm) {
        Map result = new HashMap();
        rateQueryForm.setLevel(0);
        int countGood = rateService.countByFilter(rateQueryForm);
        rateQueryForm.setLevel(1);
        int countMid = rateService.countByFilter(rateQueryForm);
        rateQueryForm.setLevel(2);
        int countBad = rateService.countByFilter(rateQueryForm);
        int total = countGood + countMid + countBad;
        result.put("countGood", countGood);
        result.put("countMid", countMid);
        result.put("countBad", countBad);
        result.put("total", total);
        return result;
    }
}
