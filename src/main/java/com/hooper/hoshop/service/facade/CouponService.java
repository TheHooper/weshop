package com.hooper.hoshop.service.facade;


import com.hooper.hoshop.admin.form.UserCouponFilterForm;
import com.hooper.hoshop.admin.form.coupon.*;
import com.hooper.hoshop.dto.coupon.CouponCatsDto;
import com.hooper.hoshop.dto.coupon.CouponCounter;
import com.hooper.hoshop.dto.coupon.UserCouponDto;
import com.hooper.hoshop.entity.Coupon;
import com.hooper.hoshop.entity.UserCoupon;
import com.hooper.hoshop.web.form.coupon.OrderQueryCouponForm;
import com.hooper.hoshop.web.form.coupon.UserQueryCouponForm;

import java.util.List;

/**
 *
 * Created by 47123 on 2016/5/31.
 */
public interface CouponService extends GenericService<UserCoupon, Integer> {

    public List<UserCoupon> selectUserCopuns(UserCouponFilterForm userCouponFilterForm);

    public List<Coupon> selectCoupon(CouponFilterForm couponFilterForm, int limit, int offset);

    public void sendCoupon(CouponSendForm couponSendForm);

    public void sendBatchCoupon(CouponBatchForm couponBatchForm);

    public int countCoupon(CouponFilterForm couponFilterForm);

    public void insertCoupon(CouponAddForm couponAddForm);

    public void updateCoupon(CouponModifyForm couponModifyForm);

    List<UserCouponDto> selectUserCoupons(UserQueryCouponForm userQueryCouponForm);

    public List<CouponCatsDto> selectCategoriesByCouponsId(Integer couponId);

    public List<UserCouponDto> selectUseableCoupon(OrderQueryCouponForm orderQueryCouponForm, UserQueryCouponForm userQueryCouponForm);

    public CouponCounter selectCouponCounter(int couponId);

    public UserCouponDto selectUserCouponById(int userCouponId);
}
