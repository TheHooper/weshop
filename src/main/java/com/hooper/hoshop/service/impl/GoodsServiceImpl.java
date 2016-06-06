package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.GoodsForm;
import com.hooper.hoshop.admin.form.GoodsSelectorForm;
import com.hooper.hoshop.common.Enum.GoodsStateEnum;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.SkuIdUtil;
import com.hooper.hoshop.dao.*;
import com.hooper.hoshop.dto.goods.GoodsAttrVo;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.GoodsService;
import com.hooper.hoshop.web.form.GoodsFilterForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/16.
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    GoodsAttrMapper goodsAttrMapper;

    @Autowired
    GoodsSkuMapper goodsSkuMapper;

    @Autowired
    GoodsDetailMapper goodsDetailMapper;

    @Autowired
    GoodsCatMapper goodsCatMapper;

    @Override
    public int insert(Goods goods) {
        return 0;
    }

    @Override
    public int update(Goods goods) {
        return 0;
    }

    @Override
    public int delete(Integer goodsId) {
        if (goodsId != null) {
            Goods goods = new Goods();
            goods.setId(goodsId);
            goods.setuTime(System.currentTimeMillis());
            goods.setIsDel(true);
            try {
                return goodsMapper.updateByPrimaryKeySelective(goods);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "没有获取到必要参数 null param error！");
        }
    }

    @Override
    public Goods selectById(Integer id) {
        Goods result = null;
        try {
            result = goodsMapper.selectByPrimaryKey(id);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        return result;
    }

    @Override
    public List<Goods> selectList() {
        return null;
    }

    public List<Goods> selectListWithoutPulloff(GoodsFilterForm goodsFilterForm) {
        List<Goods> result = null;
        try {
            Map params = new HashMap();
            params.put("title", goodsFilterForm.getTitle());
            params.put("catId", goodsFilterForm.getCatId());
            params.put("price", goodsFilterForm.getPrice());
            params.put("time", goodsFilterForm.getTime());
            params.put("sold", goodsFilterForm.getSold());
            params.put("orderType", goodsFilterForm.getOrderType());
            params.put("offset", goodsFilterForm.getOffset());
            params.put("limit", goodsFilterForm.getLimit());
            result = goodsMapper.selectListPagedWithoutPulloff(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Goods>() : result;
        return result;
    }

    public int countList(GoodsFilterForm goodsFilterForm) {
        try {
            Map params = new HashMap();
            params.put("title", goodsFilterForm.getTitle());
            params.put("catId", goodsFilterForm.getCatId());
            return goodsMapper.countListPagedWithoutPulloff(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = java.lang.Exception.class)
    public void addGoods(GoodsForm goodsForm) {
        if (goodsForm != null) {
            int totalSku = 0;
            for (GoodsSku sku : goodsForm.getGoodsSkus()) {
                totalSku = totalSku + sku.getOrginalNum();
            }
            Goods goods = goodsForm.getGoods();
            goods.setOrginalNum(totalSku);
            goods.setStock(totalSku);
            goods.setSaledNum(0);
            goods.setcTime(System.currentTimeMillis());
            goods.setStatus(GoodsStateEnum.PULL_OFF.getValue());
            goods.setIsDel(false);
            try {
                goodsMapper.insert(goods);
                int goodsId = goods.getId();//after insert ,we get goodsId
                for (GoodsAttr goodsAttr : goodsForm.getGoodsAttrs()) {
                    goodsAttr.setGoodsId(goodsId);
                    goodsAttrMapper.insert(goodsAttr);
                }
                for (GoodsSku sku : goodsForm.getGoodsSkus()) {
                    sku.setGoodsId(goodsId);
                    sku.setSaledNum(0);
                    sku.setStockNum(sku.getOrginalNum());
                    Map<String, Integer> attrIdMap = SkuIdUtil.skuIdToMap(sku.getSkuId());
                    for (String key : attrIdMap.keySet()) {
                        if (SkuIdUtil.ATTR_ID_KEY.equals(key)) {
                            sku.setAttributeIdA(attrIdMap.get(key));
                        } else if (SkuIdUtil.ATTR_ID_SECOND_KEY.equals(key)) {
                            sku.setAttributeIdAa(attrIdMap.get(key));
                        }
                    }
                    goodsSkuMapper.insert(sku);
                }
                if (goodsForm.getGoodsCat() != null) {
                    GoodsCat goodsCat = goodsForm.getGoodsCat();
                    goodsCat.setGoodsId(goodsId);
                    goodsCatMapper.insert(goodsCat);
                }
                if (!"".equals(goodsForm.getGoodsDetail()) && goodsForm.getGoodsDetail() != null) {
                    GoodsDetail goodsDetail = goodsForm.getGoodsDetail();
                    goodsDetail.setIsDel(false);
                    goodsDetail.setcTime(System.currentTimeMillis());
                    goodsDetail.setGoodsId(goodsId);
                    goodsDetailMapper.insert(goodsDetail);
                }
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = java.lang.Exception.class)
    public void updateGoods(GoodsForm goodsForm) {
        if (goodsForm != null) {
            int totalSku = 0;
            for (GoodsSku sku : goodsForm.getGoodsSkus()) {
                totalSku = totalSku + sku.getOrginalNum();
            }
            Goods goods = goodsForm.getGoods();
            goods.setOrginalNum(totalSku);
            goods.setStock(totalSku);
            goods.setcTime(System.currentTimeMillis());
            goods.setIsDel(false);
            int goodsId = goods.getId();
//            try {
            goodsMapper.updateByPrimaryKeySelective(goods);
            for (GoodsAttr goodsAttr : goodsForm.getGoodsAttrs()) {
                goodsAttr.setGoodsId(goodsId);
                goodsAttrMapper.insertOrUpdate(goodsAttr);
            }
            for (GoodsSku sku : goodsForm.getGoodsSkus()) {
                sku.setGoodsId(goodsId);
                sku.setSaledNum(0);
                sku.setStockNum(sku.getOrginalNum());
                Map<String, Integer> attrIdMap = SkuIdUtil.skuIdToMap(sku.getSkuId());
                for (String key : attrIdMap.keySet()) {
                    if (SkuIdUtil.ATTR_ID_KEY.equals(key)) {
                        sku.setAttributeIdA(attrIdMap.get(key));
                    } else if (SkuIdUtil.ATTR_ID_SECOND_KEY.equals(key)) {
                        sku.setAttributeIdAa(attrIdMap.get(key));
                    }
                }
                goodsSkuMapper.insertOrUpdate(sku);
            }
            if (goodsForm.getGoodsCat() != null) {
                GoodsCat goodsCat = goodsForm.getGoodsCat();
                goodsCat.setGoodsId(goodsId);
                goodsCatMapper.updateByPrimaryKeySelective(goodsCat);
            }
            if (!"".equals(goodsForm.getGoodsDetail()) && goodsForm.getGoodsDetail() != null) {
                GoodsDetail goodsDetail = goodsForm.getGoodsDetail();
                goodsDetail.setIsDel(false);
                goodsDetail.setcTime(System.currentTimeMillis());
                goodsDetail.setGoodsId(goodsId);
                goodsDetailMapper.updateByPrimaryKeySelective(goodsDetail);
            }
//            }catch (Exception e){
//                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED,"数据库操作失败！"+e.toString());
//            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
    }

    @Override
    public List<Goods> selectListPaged(GoodsSelectorForm selectorForm, Integer offset, Integer limit) {
        List<Goods> result = null;
        try {
            Map params = new HashMap();
            params.put("title", selectorForm.getTitle());
            params.put("catId", selectorForm.getCatId());
            params.put("status", selectorForm.getStatus());
            params.put("price", selectorForm.getPrice());
            params.put("time", selectorForm.getTime());
            params.put("sold", selectorForm.getSold());
            params.put("orderType", selectorForm.getOrderType());
            params.put("offset", offset);
            params.put("limit", limit);
            result = goodsMapper.selectListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Goods>() : result;
        return result;
    }

    @Override
    public int countListPaged(GoodsSelectorForm selectorForm) {
        try {
            Map params = new HashMap();
            params.put("title", selectorForm.getTitle());
            params.put("catId", selectorForm.getCatId());
            params.put("status", selectorForm.getStatus());
            return goodsMapper.countListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public GoodsCat selectGoodsCatByGoodsId(Integer goodsId) {
        GoodsCat result = null;
        try {
            result = goodsCatMapper.selectByGoodsId(goodsId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        return result;
    }

    @Override
    public List<GoodsSku> selectGoodsSkuByGoodsId(Integer goodsId) {
        List<GoodsSku> result = null;
        try {
            result = goodsSkuMapper.selectByGoodsId(goodsId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<GoodsSku>() : result;
        return result;
    }

    @Override
    public List<GoodsAttrVo> selectGoodsAttrByGoodsId(Integer goodsId) {
        List<GoodsAttrVo> result = null;
        try {
            result = goodsAttrMapper.selectVoListByGoodsId(goodsId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<GoodsAttrVo>() : result;
        return result;
    }

    @Override
    public GoodsDetail selectGoodsDetailByGoodsId(Integer goodsId) {
        GoodsDetail result = null;
        try {
            result = goodsDetailMapper.selectByGoodsId(goodsId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        return result;
    }

    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED, rollbackFor = java.lang.Exception.class)
    public void changeGoodsStatus(Integer goodsId, Integer status) {
        if (goodsId != null && status != null) {
            Goods goods = new Goods();
            goods.setId(goodsId);
            goods.setStatus(status);
            goods.setuTime(System.currentTimeMillis());
            try {
                goodsMapper.updateByPrimaryKeySelective(goods);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "没有获取到必要参数 null param error！");
        }
    }
}
