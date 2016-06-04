package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.CouponFilterForm;
import com.hooper.hoshop.admin.form.CouponSendForm;
import com.hooper.hoshop.admin.form.UserCouponFilterForm;
import com.hooper.hoshop.entity.Coupon;
import com.hooper.hoshop.entity.UserCoupon;

import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
public interface CouponService extends GenericService<UserCoupon, Integer> {

    public List<UserCoupon> selectUserCopuns(UserCouponFilterForm userCouponFilterForm);

    public List<Coupon> selectCoupon(CouponFilterForm couponFilterForm);

    public void sendCoupon(CouponSendForm couponSendForm);
}
