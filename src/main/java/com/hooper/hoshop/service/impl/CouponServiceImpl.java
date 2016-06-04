package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.CouponFilterForm;
import com.hooper.hoshop.admin.form.CouponSendForm;
import com.hooper.hoshop.admin.form.UserCouponFilterForm;
import com.hooper.hoshop.dao.CouponMapper;
import com.hooper.hoshop.dao.UserCouponMapper;
import com.hooper.hoshop.entity.Coupon;
import com.hooper.hoshop.entity.UserCoupon;
import com.hooper.hoshop.service.facade.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
@Service
public class CouponServiceImpl implements CouponService {

    @Autowired
    CouponMapper couponMapper;

    @Autowired
    UserCouponMapper userCouponMapper;

    @Override
    public List<UserCoupon> selectUserCopuns(UserCouponFilterForm userCouponFilterForm) {
        return null;
    }

    @Override
    public List<Coupon> selectCoupon(CouponFilterForm couponFilterForm) {
        return null;
    }

    @Override
    public void sendCoupon(CouponSendForm couponSendForm) {

    }

    @Override
    public int insert(UserCoupon userCoupon) {
        return 0;
    }

    @Override
    public int update(UserCoupon userCoupon) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public UserCoupon selectById(Integer id) {
        return null;
    }

    @Override
    public List<UserCoupon> selectList() {
        return null;
    }
}
