package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.CartGoodsMapper;
import com.hooper.hoshop.entity.CartGoods;
import com.hooper.hoshop.service.facade.CartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/25.
 */
@Service
public class CartsServiceImpl implements CartsService {

    @Autowired
    CartGoodsMapper cartGoodsMapper;


    public List<CartGoods> selectListByUserId(Integer id) {
        if (id != null) {
            List<CartGoods> result = null;
            try {
                result = cartGoodsMapper.selectByUserId(id);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
            result = result == null ? new ArrayList<CartGoods>() : result;
            return result;
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "参数为空！");
        }
    }


    @Override
    public int insert(CartGoods cartGoods) {
        if (cartGoods != null) {
            try {
                cartGoods.setcTime(System.currentTimeMillis());
                cartGoods.setuTime(System.currentTimeMillis());
                cartGoods.setIsDel(false);
                cartGoodsMapper.insert(cartGoods);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int update(CartGoods cartGoods) {
        return 0;
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public int update(List<CartGoods> cartGoodsList) {
        if (cartGoodsList != null) {
            for (CartGoods cartGoods : cartGoodsList) {
                try {
                    if (cartGoods.getId() == null) {
                        throw new BusinessException(WebErrorConstant.PARAM_NULL, "参数为空！");
                    }
                    cartGoods.setcTime(System.currentTimeMillis());
                    cartGoods.setuTime(System.currentTimeMillis());
                    cartGoods.setIsDel(false);
                    cartGoodsMapper.updateByPrimaryKeySelective(cartGoods);
                } catch (Exception e) {
                    throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
                }
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int delete(Integer id) {
        if (id != null) {
            try {
                CartGoods cartGoods = new CartGoods();
                cartGoods.setId(id);
                cartGoods.setuTime(System.currentTimeMillis());
                cartGoods.setIsDel(true);
                cartGoodsMapper.updateByPrimaryKeySelective(cartGoods);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public CartGoods selectById(Integer id) {
        return null;
    }

    @Override
    public List<CartGoods> selectList() {
        return null;
    }
}
