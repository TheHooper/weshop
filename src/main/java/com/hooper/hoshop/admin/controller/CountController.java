package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.dto.count.CatsCounter;
import com.hooper.hoshop.dto.count.DateCounter;
import com.hooper.hoshop.dto.count.GoodsCounter;
import com.hooper.hoshop.service.impl.CounterServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 * Created by 47123 on 2016/6/2.
 */
@Controller
@RequestMapping("admin/count/")
public class CountController {

    @Resource
    CounterServiceImpl conterService;

    @RequestMapping(value = "/dateCount")
    public String toDateCount() {
        return "admin/counter/dateCount";
    }

    @RequestMapping(value = "/dateSum")
    public String toDateSum() {
        return "admin/counter/dateSum";
    }

    @RequestMapping(value = "/catsCount")
    public String toCatsCount() {
        return "admin/counter/catsCount";
    }

    @RequestMapping(value = "/catsSum")
    public String toCatsSum() {
        return "admin/counter/catsSum";
    }

    @RequestMapping(value = "/goodsCount")
    public String toGoodsCount() {
        return "admin/counter/goodsCount";
    }

    @RequestMapping(value = "/goodsSum")
    public String toGoodsSum() {
        return "admin/counter/goodsSum";
    }


    @RequestMapping(value = "/date", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    DateCounter queryDate(Long startTime, Long endTime, Integer type) {
        return conterService.queryDate(startTime, endTime, type);
    }


    @RequestMapping(value = "/week", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<DateCounter> countWeek(Integer type) {
        return conterService.countWeeks(type);
    }

    @RequestMapping(value = "/month", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<DateCounter> countMonth(Integer type) {
        return conterService.countMonth(type);
    }

    @RequestMapping(value = "/goods", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<GoodsCounter> countGoods(Integer type) {
        return conterService.countGoods(type);
    }

    @RequestMapping(value = "/cats/{parentId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<CatsCounter> countCats(@PathVariable Integer parentId, Integer type) {
        return conterService.countCats(parentId, type);
    }

    @RequestMapping(value = "/catsParent", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<CatsCounter> countCats(Integer type) {
        return conterService.countCatsParent(type);
    }
}
