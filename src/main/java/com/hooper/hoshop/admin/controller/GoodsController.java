package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.admin.form.GoodsForm;
import com.hooper.hoshop.admin.form.GoodsSelectorForm;
import com.hooper.hoshop.common.Enum.GoodsStateEnum;
import com.hooper.hoshop.common.constant.AdminConstants;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.goods.GoodsAttrVo;
import com.hooper.hoshop.dto.goods.GoodsDto;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.GoodsService;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 47123 on 2016/5/13.
 */
@Controller
@RequestMapping("/admin/goods")
public class GoodsController {

    private final static Logger logger = Logger.getLogger(GoodsController.class);

    @Resource
    GoodsService goodsService;

    @RequestMapping("/list")
    public String listView() {
        return "admin/goods/goods";
    }

    @RequestMapping(value = "/cats/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    GoodsCat getCats(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsCatByGoodsId(goodsId);
    }

    @RequestMapping(value = "/status", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput changeStatus(Integer goodsId, String status) {
        Integer statusInt = null;
        if (status != null) {
            try {
                statusInt = GoodsStateEnum.valueOf(status).getValue();
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "没有获取到必要参数 null param error！");
            }
        }
        goodsService.changeGoodsStatus(goodsId, statusInt);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/del", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput delGoods(Integer goodsId) {
        goodsService.delete(goodsId);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/detail/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    GoodsDetail getDetail(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsDetailByGoodsId(goodsId);
    }

    @RequestMapping(value = "/skus/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<GoodsSku> getSkus(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsSkuByGoodsId(goodsId);
    }

    @RequestMapping(value = "/attrs/{goodsId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<GoodsAttrVo> getAttrs(@PathVariable Integer goodsId) {
        return goodsService.selectGoodsAttrByGoodsId(goodsId);
    }

    @RequestMapping(value = "/goodses", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    DataTablePageOutput getGoodsList(DataTablePageForm pageForm, GoodsSelectorForm selectorForm, HttpServletRequest request) {
        int offset = pageForm.getStart() == null ? 0 : pageForm.getStart();
        int limit = pageForm.getLength() == null ? 10 : pageForm.getLength();
        Integer statusInt = null;
        if ("".equals(selectorForm.getTitle())) {
            selectorForm.setTitle(null);
        }
        if (selectorForm.getStatusStr() != null) {
            try {
                statusInt = GoodsStateEnum.valueOf(selectorForm.getStatusStr()).getValue();
                selectorForm.setStatus(statusInt);
            } catch (Exception e) {
            }
        }
        List<Goods> goodses = goodsService.selectListPaged(selectorForm, offset, limit);
        List<GoodsDto> dtos = new ArrayList<>(goodses.size());
        for (Goods goods : goodses) {
            GoodsDto dto = new GoodsDto();
            BeanUtils.copyProperties(goods, dto);
            if (goods.getcTime() != null) {
                dto.setcTime(DateUtil.getFormatDate(new Date(goods.getcTime()), AdminConstants.ADMIN_TABLE_TIME_FORMATTER));
            }
            if (goods.getuTime() != null) {
                dto.setuTime(DateUtil.getFormatDate(new Date(goods.getuTime()), AdminConstants.ADMIN_TABLE_TIME_FORMATTER));
            }
            dtos.add(dto);
        }
        int count = goodsService.countListPaged(selectorForm);
        DataTablePageOutput output = new DataTablePageOutput();
        output.setData(dtos);
        output.setRecordsTotal(count);
        output.setRecordsFiltered(count);
        return output;
    }


    @RequestMapping(value = "/add", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput addGoods(GoodsForm goodsForm) {
        logger.info(goodsForm.getGoods().toString());
        for (GoodsAttr attr : goodsForm.getGoodsAttrs()) {
            logger.info(attr.toString());
        }
        for (GoodsSku sku : goodsForm.getGoodsSkus()) {
            logger.info(sku.toString());
        }
        logger.info(goodsForm.getGoodsDetail().getContext());
        goodsService.addGoods(goodsForm);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/update", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput updateGoods(GoodsForm goodsForm) {
        logger.info(goodsForm.getGoods().toString());
        logger.info(goodsForm.getGoodsCat().toString());
        for (GoodsAttr attr : goodsForm.getGoodsAttrs()) {
            logger.info(attr.toString());
        }
        for (GoodsSku sku : goodsForm.getGoodsSkus()) {
            logger.info(sku.toString());
        }
        logger.info(goodsForm.getGoodsDetail().getContext());
        goodsService.updateGoods(goodsForm);
        JsonOutput output = new JsonOutput();
        return output;
    }
}
