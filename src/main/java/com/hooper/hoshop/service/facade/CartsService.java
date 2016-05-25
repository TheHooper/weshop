package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.CartGoods;

import java.util.List;

/**
 * Created by 47123 on 2016/5/25.
 */
public interface CartsService extends GenericService<CartGoods, Integer> {

    public int update(List<CartGoods> cartGoodsList);

    public List<CartGoods> selectListByUserId(Integer id);
}
