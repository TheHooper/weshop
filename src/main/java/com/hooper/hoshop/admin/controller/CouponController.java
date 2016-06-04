package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.service.facade.CouponService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by 47123 on 2016/6/2.
 */
@Controller
@RequestMapping("/admin/coupon")
public class CouponController {

    @Resource
    CouponService couponService;

    @RequestMapping(value = "coupons", method = {RequestMethod.GET, RequestMethod.POST})
    public String couponsView() {
        return "admin/coupons/coupons";
    }
}
