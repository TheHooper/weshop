package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.count.CountAttrForm;
import com.hooper.hoshop.admin.form.count.CountCatsForm;
import com.hooper.hoshop.admin.form.count.CountDateForm;
import com.hooper.hoshop.admin.form.count.CountGoodsForm;
import com.hooper.hoshop.dao.*;
import com.hooper.hoshop.dto.Count.*;
import com.hooper.hoshop.service.facade.CountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
@Service
public class CountServiceImpl implements CountService {

    @Autowired
    private AttributeMapper attributeMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private OrderGoodsMapper orderGoodsMapper;

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<AttrCountMoneyDto> countNum(CountAttrForm countAttrForm) {
        return null;
    }

    @Override
    public List<AttrCountNumDto> countMoney(CountAttrForm countAttrForm) {
        return null;
    }

    @Override
    public List<CatsCountMoneyDto> countNum(CountCatsForm countCatsForm) {
        return null;
    }

    @Override
    public List<CatsCountNumDto> countMoney(CountCatsForm countCatsForm) {
        return null;
    }

    @Override
    public List<DateCountMoneyDto> countNum(CountDateForm countDateForm) {
        return null;
    }

    @Override
    public List<DateCountNumDto> countMoney(CountDateForm countDateForm) {
        return null;
    }

    @Override
    public List<GoodsCountMoneyDto> countNum(CountGoodsForm countGoodsForm) {
        return null;
    }

    @Override
    public List<GoodsCountNumDto> countMoney(CountGoodsForm countGoodsForm) {
        return null;
    }
}
