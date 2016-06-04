package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.count.CountAttrForm;
import com.hooper.hoshop.admin.form.count.CountCatsForm;
import com.hooper.hoshop.admin.form.count.CountDateForm;
import com.hooper.hoshop.admin.form.count.CountGoodsForm;
import com.hooper.hoshop.dto.Count.*;

import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
public interface CountService {

    public List<AttrCountMoneyDto> countNum(CountAttrForm countAttrForm);

    public List<AttrCountNumDto> countMoney(CountAttrForm countAttrForm);

    public List<CatsCountMoneyDto> countNum(CountCatsForm countCatsForm);

    public List<CatsCountNumDto> countMoney(CountCatsForm countCatsForm);

    public List<DateCountMoneyDto> countNum(CountDateForm countDateForm);

    public List<DateCountNumDto> countMoney(CountDateForm countDateForm);

    public List<GoodsCountMoneyDto> countNum(CountGoodsForm countGoodsForm);

    public List<GoodsCountNumDto> countMoney(CountGoodsForm countGoodsForm);
}
