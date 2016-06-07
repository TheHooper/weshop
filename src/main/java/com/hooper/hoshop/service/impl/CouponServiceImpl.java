package com.hooper.hoshop.service.impl;


import com.hooper.hoshop.admin.form.UserCouponFilterForm;
import com.hooper.hoshop.admin.form.coupon.*;
import com.hooper.hoshop.common.Enum.CouponStateEnum;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.BeanToMapUtil;
import com.hooper.hoshop.dao.*;
import com.hooper.hoshop.dto.count.UserMoneyDto;
import com.hooper.hoshop.dto.count.UserOrdersDto;
import com.hooper.hoshop.dto.coupon.CouponCatsDto;
import com.hooper.hoshop.dto.coupon.CouponCounter;
import com.hooper.hoshop.dto.coupon.UserCouponDto;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.CouponService;
import com.hooper.hoshop.web.form.coupon.OrderQueryCouponForm;
import com.hooper.hoshop.web.form.coupon.UserQueryCouponForm;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 *
 * Created by 47123 on 2016/5/31.
 */
@Service
public class CouponServiceImpl implements CouponService {

    @Autowired
    CouponMapper couponMapper;

    @Autowired
    UserCouponMapper userCouponMapper;

    @Autowired
    CouponCatsMapper couponCatsMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    GoodsCatMapper goodsCatMapper;

    @Override
    public List<UserCoupon> selectUserCopuns(UserCouponFilterForm userCouponFilterForm) {
        return null;
    }

    public UserCouponDto selectUserCouponById(int userCouponId) {
        return userCouponMapper.selectDtoById(userCouponId);
    }

    @Override
    public CouponCounter selectCouponCounter(int couponId) {
        Map filter = new HashMap();
        filter.put("couponId", couponId);
        filter.put("time", System.currentTimeMillis());
        filter.put("state", 0);
        int unuse = userCouponMapper.countByFilter(filter);
        filter.put("state", 1);
        int used = userCouponMapper.countByFilter(filter);
        filter.put("state", 2);
        int fade = userCouponMapper.countByFilter(filter);
        CouponCounter couponCounter = new CouponCounter();
        couponCounter.setUnuse(unuse);
        couponCounter.setUsed(used);
        couponCounter.setFade(fade);
        return couponCounter;
    }

    @Override
    public List<Coupon> selectCoupon(CouponFilterForm couponFilterForm, int limit, int offset) {
        List<Coupon> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(couponFilterForm);
            params.put("offset", offset);
            params.put("limit", limit);
            result = couponMapper.selectListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Coupon>() : result;
        return result;
    }

    @Override
    public int countCoupon(CouponFilterForm couponFilterForm) {
        try {
            Map params = BeanToMapUtil.convertBean(couponFilterForm);
            return couponMapper.countListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void sendCoupon(CouponSendForm couponSendForm) {
        Coupon coupon = couponMapper.selectByPrimaryKey(couponSendForm.getCouponId());
        for (int userId : couponSendForm.getUserIds()) {
            UserCoupon userCoupon = new UserCoupon();
            userCoupon.setIsDel(false);
            userCoupon.setCouponsId(coupon.getId());
            userCoupon.setUserId(userId);
            userCoupon.setState(CouponStateEnum.UNUSE.getValue());
            userCoupon.setDeadline(System.currentTimeMillis() + (coupon.getLimitDays() * 86400000L));
            userCouponMapper.insert(userCoupon);
        }
        coupon.setNum(coupon.getNum() - couponSendForm.getUserIds().size());
        couponMapper.updateByPrimaryKeySelective(coupon);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void sendBatchCoupon(CouponBatchForm couponBatchForm) {
        int type = couponBatchForm.getSendType();
        Coupon coupon = couponMapper.selectByPrimaryKey(couponBatchForm.getCouponId());
        if (coupon != null) {
            List<User> users = new ArrayList<>();
            if (type < 2) {
                Integer orderType = 1;
                if (type != 0) {
                    orderType = 0;
                }
                List<UserMoneyDto> userMoneyDtos = userMapper.selectUserOrderByCost(orderType);
                for (UserMoneyDto userMoneyDto : userMoneyDtos) {
                    User user = userMoneyDto;
                    users.add(user);
                }
            } else if (2 <= type && type <= 3) {
                Integer orderType = 1;
                if (type != 2) {
                    orderType = 0;
                }
                List<UserOrdersDto> userOrdersDtos = userMapper.selectUserOrderByOrdersCount(orderType);
                for (UserOrdersDto userOrdersDto : userOrdersDtos) {
                    User user = userOrdersDto;
                    users.add(user);
                }
            } else {
                Integer orderType = 1;
                if (type != 3) {
                    orderType = 0;
                }
                Map map = new HashMap();
                map.put("offset", 0);
                map.put("limit", couponBatchForm.getNum());
                map.put("orderType", orderType);
                users = userMapper.selectListPaged(map);
            }
            for (User user : users) {
                if (coupon.getNum() > 0) {
                    UserCoupon userCoupon = new UserCoupon();
                    userCoupon.setIsDel(false);
                    userCoupon.setCouponsId(coupon.getId());
                    userCoupon.setUserId(user.getId());
                    userCoupon.setState(CouponStateEnum.UNUSE.getValue());
                    userCoupon.setDeadline(System.currentTimeMillis() + (coupon.getLimitDays() * 86400000L));
                    userCouponMapper.insert(userCoupon);
                    coupon.setNum(coupon.getNum() - 1);
                }
            }
            couponMapper.updateByPrimaryKey(coupon);
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "coupon missed could not send！");
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertCoupon(CouponAddForm couponAddForm) {
        Coupon coupon = new Coupon();
        BeanUtils.copyProperties(couponAddForm, coupon);
        coupon.setIsDel(false);
        couponMapper.insert(coupon);
        System.out.println(coupon.getId());

        for (int catsId : couponAddForm.getParentCatsId()) {
            CouponCats couponCats = new CouponCats();
            couponCats.setCouponsId(coupon.getId());
            couponCats.setCatsId(catsId);
            couponCatsMapper.insert(couponCats);
        }
    }

    public void updateCoupon(CouponModifyForm couponModifyForm) {
        Coupon coupon = couponMapper.selectByPrimaryKey(couponModifyForm.getId());
        BeanUtils.copyProperties(couponModifyForm, coupon);
        couponMapper.updateByPrimaryKey(coupon);
    }

    @Override
    public int insert(UserCoupon userCoupon) {
        return 0;
    }

    @Override
    public int update(UserCoupon userCoupon) {
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public int delete(Integer id) {
        Coupon coupon = couponMapper.selectByPrimaryKey(id);
        coupon.setIsDel(true);
        couponMapper.updateByPrimaryKey(coupon);
        return userCouponMapper.deleteByCouponId(coupon.getId());
    }

    @Override
    public UserCoupon selectById(Integer id) {
        return null;
    }

    @Override
    public List<UserCoupon> selectList() {
        return null;
    }

    @Override
    public List<UserCouponDto> selectUserCoupons(UserQueryCouponForm userQueryCouponForm) {
        List<UserCouponDto> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(userQueryCouponForm);
            result = userCouponMapper.selectByFilter(params);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<UserCouponDto>() : result;
        return result;
    }

    @Override
    public List<CouponCatsDto> selectCategoriesByCouponsId(Integer couponsId) {
        return categoryMapper.selectByCouponsId(couponsId);
    }

    @Override
    public List<UserCouponDto> selectUseableCoupon(OrderQueryCouponForm orderQueryCouponForm, UserQueryCouponForm userQueryCouponForm) {
        userQueryCouponForm.setState(CouponStateEnum.UNUSE.getValue());
        List<UserCouponDto> useable = new ArrayList<>();
        try {
            Map params = BeanToMapUtil.convertBean(userQueryCouponForm);
            List<UserCouponDto> result = userCouponMapper.selectByFilter(params);//优惠券
            TreeSet<Integer> goodCats = new TreeSet();//商品类别
            if (result != null) {
                for (Integer goodsId : orderQueryCouponForm.getGoodsIds()) {
                    GoodsCat goodscat = goodsCatMapper.selectByGoodsId(goodsId);
                    goodCats.add(goodscat.getCats());
                }
            }
            for (UserCouponDto userCouponDto : result) {
                boolean canUse = true;

                if (userCouponDto.getThreshold().compareTo(orderQueryCouponForm.getTotal()) == 1) {
                    canUse = false;
                    break;
                }

                if (canUse) {
                    List<CouponCatsDto> couponCatses = categoryMapper.selectByCouponsId(userCouponDto.getCouponsId());
                    couponCatses = couponCatses == null ? new ArrayList<CouponCatsDto>() : couponCatses;
                    if (couponCatses.size() > 0) {
                        TreeSet<Integer> couponCatsesSet = new TreeSet();//获取优惠券的类别
                        for (CouponCatsDto catsDto : couponCatses) {
                            couponCatsesSet.add(catsDto.getId());
                        }
                        for (Integer goodsCats : goodCats) {
                            if (!couponCatsesSet.contains(goodsCats)) {
                                canUse = false;
                                break;
                            }
                        }
                    } else {
                        //canUse is true;
                    }
                }

                if (canUse) {
                    useable.add(userCouponDto);
                }

            }
            return useable;
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }
}
