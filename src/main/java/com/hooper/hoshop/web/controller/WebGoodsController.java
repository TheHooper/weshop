package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.Enum.UserAuthEnum;
import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.exception.NoFoundException;
import com.hooper.hoshop.dto.Goods.GoodsAttrVo;
import com.hooper.hoshop.entity.Goods;
import com.hooper.hoshop.entity.GoodsDetail;
import com.hooper.hoshop.entity.GoodsSku;
import com.hooper.hoshop.service.facade.GoodsService;
import com.hooper.hoshop.service.facade.GoodsSkuService;
import com.hooper.hoshop.web.form.AttrIdListForm;
import com.hooper.hoshop.web.form.GoodsFilterForm;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 47123 on 2016/4/29.
 */
@Controller
@RequestMapping("/goods")
public class WebGoodsController {

    private final static Logger logger = Logger.getLogger(WebGoodsController.class);

    @Resource
    GoodsService goodsService;

    @Resource
    GoodsSkuService goodsSkuService;

    @RequestMapping("/list")
    public ModelAndView goodsView(String title, Integer catId, ModelAndView modelAndView) {
        modelAndView = new ModelAndView("/goods/goodsList");
        modelAndView.addObject("title", title);
        modelAndView.addObject("catId", catId);
        return modelAndView;
    }

    //    @UserLoginAnnotation(isLogin =  UserAuthEnum.YES)
    @RequestMapping("/detail/{goodsId}")
    public ModelAndView goodsDetailView(@PathVariable Integer goodsId, ModelAndView modelAndView) {
        modelAndView = new ModelAndView("/goods/goods");
        Goods goods = goodsService.selectById(goodsId);
        System.out.println(goods.toString());
        if (goods == null) {
            throw new NoFoundException();
        }
        modelAndView.addObject("goods", goods);
        return modelAndView;
    }

    @RequestMapping(value = "/goodses", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Goods> getGoodes(GoodsFilterForm goodsFilterForm) {
        System.out.println("goodsFilter" + goodsFilterForm.toString());
        List<Goods> goodses = goodsService.selectListWithoutPulloff(goodsFilterForm);
        return goodses;
    }

    @RequestMapping(value = "/detail/single/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    GoodsDetail getDetail(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsDetailByGoodsId(goodsId);
    }

    @RequestMapping(value = "/sku/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    GoodsSku getSku(@PathVariable Integer goodsId, AttrIdListForm attrIdListForm) {
        for (Integer i : attrIdListForm.getAttrIds()) {
            System.out.println(goodsId + "  " + i);
        }
        return goodsSkuService.selectBySkuId(goodsId, attrIdListForm.getAttrIds());
    }

    @RequestMapping(value = "/attrs/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<GoodsAttrVo> getAttrs(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsAttrByGoodsId(goodsId);
    }
}
