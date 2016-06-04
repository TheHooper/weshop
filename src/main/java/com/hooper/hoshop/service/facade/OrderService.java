package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.OrderDeliveryForm;
import com.hooper.hoshop.web.form.OrderFilterForm;
import com.hooper.hoshop.entity.CartGoods;
import com.hooper.hoshop.entity.Goods;
import com.hooper.hoshop.entity.Order;
import com.hooper.hoshop.entity.OrderGoods;
import com.hooper.hoshop.web.form.GoodsCheckoutForm;
import com.hooper.hoshop.web.form.OrderPayForm;

import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/25.
 */
public interface OrderService extends GenericService<Order, Integer> {

    public Map<String, Object> checkoutFromCarts(int userId);

    public Map<String, Object> checkout(GoodsCheckoutForm goodsCheckoutForm, int userId);

    public List<Order> selectOrdersByUserIdAndState(int userId, Integer state);

    public List<Order> selectOrders(OrderFilterForm orderFilterForm);

    public int countOrders(OrderFilterForm orderFilterForm);

    public Order delivery(OrderDeliveryForm orderDeliveryForm);

    public List<OrderGoods> selectOrderGoodsByOrderId(int orderId);

    public OrderGoods selectOrderGoodsOneByOrderId(int orderId);

    public void pay(OrderPayForm orderPayForm, int userId);

    public void receive(int orderId, int userId);

    public void rated(int orderId, int userId);
}
