package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dao.CategoryMapper;
import com.hooper.hoshop.dao.GoodsMapper;
import com.hooper.hoshop.dao.OrderMapper;
import com.hooper.hoshop.dto.count.CatsCounter;
import com.hooper.hoshop.dto.count.DateCounter;
import com.hooper.hoshop.dto.count.GoodsCounter;
import com.hooper.hoshop.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 47123 on 2016/6/6.
 */
@Service
public class CounterServiceImpl {

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    OrderMapper orderMapper;

    //type = 1 sum; type = 0 count

    public DateCounter queryDate(Long startTime, Long endTime, Integer type) {
        DateCounter dateCounter = new DateCounter();
        dateCounter.setName(DateUtil.getFormatDate(new Date(startTime), WebConstant.TIME_FORMATTER) + " : "
                + DateUtil.getFormatDate(new Date(endTime), WebConstant.TIME_FORMATTER));
        Integer counter;
        if (type == 1) {
            counter = orderMapper.countCostByTime(startTime, endTime);
        } else {
            counter = orderMapper.countNumByTime(startTime, endTime);
        }
        dateCounter.setCounter(counter);
        return dateCounter;
    }


    public List<DateCounter> countWeeks(Integer type) {
        long[] weeksLong = DateUtil.getWeekdays();
        List<DateCounter> result = new ArrayList<>();
        for (long startTime : weeksLong) {
            long endTime = startTime + DateUtil.getOneDayMills();
            Integer counter;
            if (type == 1) {
                counter = orderMapper.countCostByTime(startTime, endTime);
            } else {
                counter = orderMapper.countNumByTime(startTime, endTime);
            }
            DateCounter dateCounter = new DateCounter();
            dateCounter.setCounter(counter);
            dateCounter.setName(String.valueOf(DateUtil.getWeekDay(startTime)));
            result.add(dateCounter);
        }
        return result;
    }

    public List<DateCounter> countMonth(Integer type) {
        long[] monthsOfYearMills = DateUtil.getMonthsOfYearMills();
        List<DateCounter> result = new ArrayList<>();
        for (int i = 0; i < monthsOfYearMills.length; i++) {
            long endTime;
            if (i != monthsOfYearMills.length - 1) {
                endTime = monthsOfYearMills[i + 1];
            } else {
                endTime = monthsOfYearMills[i] + DateUtil.getLastMonthMills();
            }
            Integer counter;
            if (type == 1) {
                counter = orderMapper.countCostByTime(monthsOfYearMills[i], endTime);
            } else {
                counter = orderMapper.countNumByTime(monthsOfYearMills[i], endTime);
            }
            System.out.println(monthsOfYearMills[i] + " to :" + endTime);
            System.out.println(DateUtil.getFormatDate(new Date(monthsOfYearMills[i]), WebConstant.TIME_FORMATTER) + " to :" + DateUtil.getFormatDate(new Date(endTime), WebConstant.TIME_FORMATTER));
            DateCounter dateCounter = new DateCounter();
            dateCounter.setCounter(counter);
            dateCounter.setName(String.valueOf(i + 1));
            result.add(dateCounter);
        }
        return result;
    }

    public List<GoodsCounter> countGoods(Integer type) {
        if (type == 1) {
            return goodsMapper.countCostByGoods();
        } else {
            return goodsMapper.countNumByGoods();
        }
    }

    public List<CatsCounter> countCatsParent(Integer type) {
        List<Category> categories = categoryMapper.selectParents();
        List<CatsCounter> catsCounters = new ArrayList<>();
        for (Category category : categories) {
            Integer counter;
            if (type == 1) {
                counter = categoryMapper.countCostCatsParent(category.getId());
            } else {
                counter = categoryMapper.countNumCatsParent(category.getId());
            }
            CatsCounter catsCounter = new CatsCounter();
            catsCounter.setCounter(counter);
            catsCounter.setCatsName(category.getTypeName());
            catsCounter.setCats(category.getId());
            catsCounters.add(catsCounter);
        }
        return catsCounters;
    }

    public List<CatsCounter> countCats(Integer parentId, Integer type) {
        if (type == 1) {
            return categoryMapper.countCostByCats(parentId);
        } else {
            return categoryMapper.countNumByCats(parentId);
        }
    }
}
