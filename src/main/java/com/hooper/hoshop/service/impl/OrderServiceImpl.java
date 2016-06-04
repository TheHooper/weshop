package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.OrderDeliveryForm;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.util.BeanToMapUtil;
import com.hooper.hoshop.web.form.OrderFilterForm;
import com.hooper.hoshop.common.Enum.OrderStateEnum;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.exception.CheckOutExcpetion;
import com.hooper.hoshop.common.util.CodeUtil;
import com.hooper.hoshop.common.util.SkuIdUtil;
import com.hooper.hoshop.dao.*;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.OrderService;
import com.hooper.hoshop.web.form.GoodsCheckoutForm;
import com.hooper.hoshop.web.form.OrderPayForm;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/31.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private OrderGoodsMapper orderGoodsMapper;

    @Autowired
    private CartGoodsMapper cartGoodsMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsSkuMapper goodsSkuMapper;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public Map<String, Object> checkoutFromCarts(int userId) {
        List<CartGoods> cartGoodses = cartGoodsMapper.selectByUserId(userId);
        for (CartGoods cartGoods : cartGoodses) {
            Map map = new HashMap<String, Object>();
            map.put("goodsId", cartGoods.getGoodsId());
            map.put("skuId1", cartGoods.getSkuId());
            GoodsSku goodsSku = goodsSkuMapper.selectBySkuIdAndGoodsId(map);
            if (goodsSku != null) {
                int newStock = goodsSku.getStockNum() - cartGoods.getNum();
                int newSaled = goodsSku.getSaledNum() + cartGoods.getNum();
                if (goodsSku.getStockNum() < cartGoods.getNum() || goodsSku.getStockNum() == 0) {
                    throw new CheckOutExcpetion(WebErrorConstant.OUT_OF_STOCK, "商品：" + cartGoods.getGoodsTitle() + ",仅剩：" + goodsSku.getStockNum() + "件，您结算的数量为：" + cartGoods.getNum());
                } else {
                    goodsSku.setStockNum(newStock);
                    goodsSku.setSaledNum(newSaled);
                }
            } else {
                throw new CheckOutExcpetion(WebErrorConstant.MISSED_SKU, "missed sku op failed");
            }
            goodsSkuMapper.updateByPrimaryKeySelective(goodsSku);
        }//sku is ok
        //to Price and dCharge
        List<OrderGoods> orderGoodses = new ArrayList<>();
        BigDecimal total = new BigDecimal(0);
        BigDecimal dCharge = new BigDecimal(0);
        for (CartGoods cartGoods : cartGoodses) {
            Goods goods = goodsMapper.selectByPrimaryKey(cartGoods.getGoodsId());
            OrderGoods orderGoods = new OrderGoods();
            BeanUtils.copyProperties(cartGoods, orderGoods);
            Map<String, Integer> attrIds = SkuIdUtil.skuIdToMap(orderGoods.getSkuId());
            orderGoods.setAttrId(attrIds.get(SkuIdUtil.ATTR_ID_KEY));
            orderGoods.setAttrId1(attrIds.get(SkuIdUtil.ATTR_ID_SECOND_KEY));
            orderGoods.setcTime(System.currentTimeMillis());
            orderGoods.setPrice(goods.getPrice());
            orderGoods.setoPrice(goods.getoPrice());
            orderGoodses.add(orderGoods);
            if (dCharge.compareTo(goods.getdCharge()) != 1) {
                dCharge = goods.getdCharge();
            }
            total = total.add(goods.getPrice().multiply(new BigDecimal(cartGoods.getNum())));
        }

        Order order = new Order();
        order.setUserId(userId);
        order.setSn(System.currentTimeMillis() + CodeUtil.getRandomString(3));
        order.setOrderPic(cartGoodses.get(0).getGoodsPic());
        order.setTotal(total);
        order.setGoodsNum(cartGoodses.size());
        order.setTotalAndDelivery(total.add(dCharge));
        order.setStatus(OrderStateEnum.WAIT_PAY.getValue());
        order.setcTime(System.currentTimeMillis());
        order.setIsDel(false);
        orderMapper.insert(order);
        int orderId = order.getId();

        for (OrderGoods orderGoods : orderGoodses) {
            orderGoods.setOrderId(orderId);
            orderGoodsMapper.insert(orderGoods);
        }

        cartGoodsMapper.cleanCartsByUserId(userId);
        Map<String, Object> result = new HashMap<>();
        result.put("orderGoods", orderGoodses);
        result.put("order", order);
        return result;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public Map<String, Object> checkout(GoodsCheckoutForm goodsCheckoutForm, int userId) {
        Goods goods = goodsMapper.selectByPrimaryKey(goodsCheckoutForm.getGoodsId());
        OrderGoods orderGoods = new OrderGoods();
        BeanUtils.copyProperties(goodsCheckoutForm, orderGoods);
        Map<String, Integer> attrIds = SkuIdUtil.skuIdToMap(orderGoods.getSkuId());
        orderGoods.setGoodsPic(goods.getGoodsMainPic());
        orderGoods.setGoodsTitle(goods.getTitle());
        orderGoods.setAttrId(attrIds.get(SkuIdUtil.ATTR_ID_KEY));
        orderGoods.setAttrId1(attrIds.get(SkuIdUtil.ATTR_ID_SECOND_KEY));
        orderGoods.setoPrice(goods.getoPrice());
        orderGoods.setPrice(goods.getPrice());
        orderGoods.setcTime(System.currentTimeMillis());
        orderGoods.setIsDel(false);

        Order order = new Order();
        order.setUserId(userId);
        order.setSn(System.currentTimeMillis() + CodeUtil.getRandomString(3));
        order.setOrderPic(goods.getGoodsMainPic());
        order.setTotal(goods.getPrice());
        order.setGoodsNum(1);
        order.setTotalAndDelivery(goods.getPrice().add(goods.getdCharge()));
        order.setStatus(OrderStateEnum.WAIT_PAY.getValue());
        order.setcTime(System.currentTimeMillis());
        order.setIsDel(false);
        orderMapper.insert(order);
        int orderId = order.getId();

        orderGoods.setOrderId(orderId);
        orderGoodsMapper.insert(orderGoods);

        Map<String, Object> result = new HashMap<>();
        result.put("orderGoods", orderGoods);
        result.put("order", order);
        return result;
    }

    @Override
    public List<Order> selectOrdersByUserIdAndState(int userId, Integer state) {
        return null;
    }

    @Override
    public List<Order> selectOrders(OrderFilterForm orderFilterForm) {
        List<Order> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(orderFilterForm);
            result = orderMapper.selectOrderByFilter(params);
            result = result == null ? new ArrayList<Order>() : result;
            return result;
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public int countOrders(OrderFilterForm orderFilterForm) {
        try {
            Map params = BeanToMapUtil.convertBean(orderFilterForm);
            System.out.println(params.toString());
            return orderMapper.countOrderByFilter(params);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public Order delivery(OrderDeliveryForm orderDeliveryForm) {
        Order order = orderMapper.selectByPrimaryKey(orderDeliveryForm.getOrderId());
        if (order != null) {
            order.setDeliveryCom(orderDeliveryForm.getDeliveryCom());
            order.setDeliveryNo(orderDeliveryForm.getDeliveryNo());
            order.setDeliveryTime(System.currentTimeMillis());
            order.setStatus(OrderStateEnum.WAIT_RECEIVE.getValue());
            try {
                orderMapper.updateByPrimaryKey(order);
                return order;
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PASS_ERROR, "null order");
        }
    }

    @Override
    public int insert(Order order) {
        return 0;
    }

    @Override
    public int update(Order order) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public Order selectById(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public List<OrderGoods> selectOrderGoodsByOrderId(int orderId) {
        List<OrderGoods> result = null;
        try {
            result = orderGoodsMapper.selectByOrderId(orderId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<OrderGoods>() : result;
        return result;
    }

    public OrderGoods selectOrderGoodsOneByOrderId(int orderId) {
        try {
            return orderGoodsMapper.selectOneByOrderId(orderId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public void pay(OrderPayForm orderPayForm, int userId) {
        Order order = orderMapper.selectByPrimaryKey(orderPayForm.getOrderId());
        //get coupon and reduce money
        if (order != null) {
            if (order.getUserId() == userId) {
                order.setStatus(OrderStateEnum.WAIT_SHIP.getValue());
                order.setAddressId(orderPayForm.getAddressId());
                order.setpTime(System.currentTimeMillis());
                orderMapper.updateByPrimaryKeySelective(order);
            } else {
                throw new BusinessException(WebErrorConstant.ILLEGAL_USER, "非法操作！");
            }
        } else {
            throw new BusinessException(WebErrorConstant.MISSED_ORDER, "非法操作！");
        }
    }

    @Override
    public void receive(int orderId, int userId) {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        if (order != null) {
            if (order.getUserId() == userId) {
                order.setStatus(OrderStateEnum.WAIT_RATE.getValue());
                orderMapper.updateByPrimaryKeySelective(order);
            } else {
                throw new BusinessException(WebErrorConstant.ILLEGAL_USER, "非法操作！");
            }
        } else {
            throw new BusinessException(WebErrorConstant.MISSED_ORDER, "非法操作！");
        }
    }

    @Override
    public void rated(int orderId, int userId) {
        Order order = orderMapper.selectByPrimaryKey(orderId);
        if (order != null) {
            if (order.getUserId() == userId) {
                order.setStatus(OrderStateEnum.COMPLETED.getValue());
                orderMapper.updateByPrimaryKeySelective(order);
            } else {
                throw new BusinessException(WebErrorConstant.ILLEGAL_USER, "非法操作！");
            }
        } else {
            throw new BusinessException(WebErrorConstant.MISSED_ORDER, "非法操作！");
        }
    }

    @Override
    public List<Order> selectList() {
        return null;
    }
}
