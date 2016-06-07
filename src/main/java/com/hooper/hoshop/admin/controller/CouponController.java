package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.admin.form.EasyPageForm;
import com.hooper.hoshop.admin.form.UserFilterForm;
import com.hooper.hoshop.admin.form.coupon.*;
import com.hooper.hoshop.dto.coupon.CouponCatsDto;
import com.hooper.hoshop.dto.coupon.CouponCounter;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.dto.output.EasyPageOutput;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.Coupon;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.CouponService;
import com.hooper.hoshop.service.facade.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/6/2.
 */
@Controller
@RequestMapping("/admin/coupon")
public class CouponController {

    @Resource
    CouponService couponService;

    @Resource
    UserService userService;

    @RequestMapping(value = "coupons", method = {RequestMethod.GET, RequestMethod.POST})
    public String couponsView() {
        return "admin/coupons/coupons";
    }

    @RequestMapping(value = "/cats", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public List<CouponCatsDto> cats(Integer couponId) {
        List<CouponCatsDto> couponCatsDtos = couponService.selectCategoriesByCouponsId(couponId);
        couponCatsDtos = couponCatsDtos == null ? new ArrayList<CouponCatsDto>() : couponCatsDtos;
        return couponCatsDtos;
    }

    @RequestMapping(value = "/counter", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public CouponCounter counter(Integer couponId) {
        return couponService.selectCouponCounter(couponId);
    }

    @RequestMapping(value = "/del", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public JsonOutput del(Integer couponId) {
        couponService.delete(couponId);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/add", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput add(@RequestBody CouponAddForm couponAddForm) {
        System.out.println(couponAddForm);
        couponService.insertCoupon(couponAddForm);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/update", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput update(CouponModifyForm couponModifyForm) {
        couponService.updateCoupon(couponModifyForm);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/send", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput send(@RequestBody CouponSendForm couponSendForm) {
        couponService.sendCoupon(couponSendForm);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/batchSend", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput batchSend(CouponBatchForm couponBatchForm) {
        couponService.sendBatchCoupon(couponBatchForm);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    EasyPageOutput getCoupons(CouponFilterForm couponFilterForm, EasyPageForm pageForm) {
        int offset = pageForm.getPage() == null ? 0 : (pageForm.getPage() - 1);
        int limit = pageForm.getRows() == null ? 10 : pageForm.getRows();
        List<Coupon> coupons = couponService.selectCoupon(couponFilterForm, limit, offset);
        EasyPageOutput output = new EasyPageOutput();
        int count = couponService.countCoupon(couponFilterForm);
        output.setRows(coupons);
        output.setTotal(count);
        return output;
    }

    @RequestMapping(value = "/list/dataTable", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    DataTablePageOutput getCouponsDataTable(CouponFilterForm couponFilterForm, DataTablePageForm pageForm) {
        int offset = pageForm.getStart() == null ? 0 : pageForm.getStart();
        int limit = pageForm.getLength() == null ? 10 : pageForm.getLength();
        List<Coupon> coupons = couponService.selectCoupon(couponFilterForm, limit, offset);
        DataTablePageOutput output = new DataTablePageOutput();
        int count = couponService.countCoupon(couponFilterForm);
        output.setData(coupons);
        output.setRecordsFiltered(count);
        output.setRecordsTotal(count);
        return output;
    }


    @RequestMapping(value = "/user/list", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    EasyPageOutput getUsers(UserFilterForm userFilterForm, EasyPageForm pageForm) {
        int offset = pageForm.getPage() == null ? 0 : (pageForm.getPage() - 1);
        int limit = pageForm.getRows() == null ? 10 : pageForm.getRows();
        List<User> coupons = userService.selectList(userFilterForm, offset, limit);
        EasyPageOutput output = new EasyPageOutput();
        int count = userService.countList(userFilterForm);
        output.setRows(coupons);
        output.setTotal(count);
        return output;
    }
}
