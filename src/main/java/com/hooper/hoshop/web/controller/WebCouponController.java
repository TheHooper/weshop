package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.dto.coupon.CouponCatsDto;
import com.hooper.hoshop.dto.coupon.UserCouponDto;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.CouponService;
import com.hooper.hoshop.web.form.coupon.OrderQueryCouponForm;
import com.hooper.hoshop.web.form.coupon.UserQueryCouponForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.TreeSet;

/**
 * Created by 47123 on 2016/6/6.
 */
@Controller
@RequestMapping("/coupon")
public class WebCouponController {

    @Resource
    CouponService couponService;


    @RequestMapping(value = "/cats", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    TreeSet<String> getCatsByCouponId(Integer couponId) {
        List<CouponCatsDto> couponCatsDtos = couponService.selectCategoriesByCouponsId(couponId);
        TreeSet<String> treeSet = new TreeSet<>();
        for (CouponCatsDto catsDto : couponCatsDtos) {
            if (!treeSet.contains(catsDto.getParentName())) {
                treeSet.add(catsDto.getParentName());
            }
        }
        return treeSet;
    }


    @UserLoginAnnotation
    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<UserCouponDto> getUserCoupons(UserQueryCouponForm userQueryCouponForm, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        userQueryCouponForm.setUserId(user.getId());
        return couponService.selectUserCoupons(userQueryCouponForm);
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/useable", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<UserCouponDto> getCanUseCoupons(UserQueryCouponForm userQueryCouponForm, @RequestBody OrderQueryCouponForm orderQueryCouponForm, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        userQueryCouponForm.setUserId(user.getId());
        return couponService.selectUseableCoupon(orderQueryCouponForm, userQueryCouponForm);
    }
}
