package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.admin.form.OrderDeliveryForm;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.order.OrderDetailOutput;
import com.hooper.hoshop.dto.order.OrderDto;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.Address;
import com.hooper.hoshop.entity.Order;
import com.hooper.hoshop.entity.OrderGoods;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.AddressService;
import com.hooper.hoshop.service.facade.OrderService;
import com.hooper.hoshop.service.facade.SmsService;
import com.hooper.hoshop.service.facade.UserService;
import com.hooper.hoshop.web.form.OrderFilterForm;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
@Controller
@RequestMapping("/admin/orders")
public class AdminOrderController {

    @Resource
    OrderService orderService;

    @Resource
    AddressService addressService;

    @Resource
    UserService userService;

    @Resource
    SmsService smsService;

    public DataTablePageOutput getOrders(DataTablePageForm dataTablePageForm) {
        return null;
    }

    public JsonOutput delivery(OrderDeliveryForm orderDeliveryForm) {
        return null;
    }

    public OrderDetailOutput getDetail(Integer orderId) {
        return null;
    }

    @RequestMapping(value = "/orders", method = {RequestMethod.POST, RequestMethod.GET})
    public String OrdersView() {
        return "admin/orders/orders";
    }

    @RequestMapping(value = "/ordersDelivery", method = {RequestMethod.GET})
    public String OrdersDeliveryView() {
        return "admin/orders/ordersDelivery";
    }

    @RequestMapping(value = "/ordersDelivery", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput OrdersDelivery(OrderDeliveryForm orderDeliveryForm) {
        Order order = orderService.delivery(orderDeliveryForm);
        OrderGoods orderGoods = orderService.selectOrderGoodsOneByOrderId(orderDeliveryForm.getOrderId());
        User user = userService.selectById(order.getUserId());
        String context = smsService.getDeliveryTemplate(order.getSn(), orderGoods.getGoodsTitle(), order.getDeliveryCom(), order.getDeliveryNo());
        smsService.sendSms(user.getMobile(), context);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/detail/{orderId}", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    OrderDetailOutput getDetail(@PathVariable int orderId) {
        Order order = orderService.selectById(orderId);
        Address address = addressService.selectById(order.getAddressId());
        User user = userService.selectById(order.getUserId());
        user.setPassword("");
        user.setPasswordRandom("");
        List<OrderGoods> orderGoodses = orderService.selectOrderGoodsByOrderId(orderId);
        //coupon judege coupon id first
        OrderDetailOutput orderDetailOutput = new OrderDetailOutput();
        orderDetailOutput.setOrder(order);
        orderDetailOutput.setAddress(address);
        orderDetailOutput.setUser(user);
        orderDetailOutput.setOrderGoodses(orderGoodses);
        return orderDetailOutput;
    }

    @RequestMapping(value = "/ordersList", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    DataTablePageOutput getOrders(OrderFilterForm orderFilterForm, DataTablePageForm pageForm) {
        int offset = pageForm.getStart() == null ? 0 : pageForm.getStart();
        int limit = pageForm.getLength() == null ? 10 : pageForm.getLength();
        orderFilterForm.setOffset(offset);
        orderFilterForm.setLimit(limit);
        List<Order> orders = orderService.selectOrders(orderFilterForm);
        List<OrderDto> orderDtos = new ArrayList<>();
        for (Order order : orders) {
            OrderDto orderDto = new OrderDto();
            BeanUtils.copyProperties(order, orderDto);
            orderDto.setcTime(DateUtil.getFormatDate(new Date(order.getcTime()), WebConstant.TIME_FORMATTER));
            if (order.getpTime() != null) {
                orderDto.setpTime(DateUtil.getFormatDate(new Date(order.getpTime()), WebConstant.TIME_FORMATTER));
            }
            if (order.getDeliveryTime() != null) {
                orderDto.setDeliveryTime(DateUtil.getFormatDate(new Date(order.getDeliveryTime()), WebConstant.TIME_FORMATTER));
            }
            orderDto.setStatusStr(WebConstant.ORDER_STATE_STR[order.getStatus()]);
            orderDtos.add(orderDto);
        }
        DataTablePageOutput output = new DataTablePageOutput();
        int count = orderService.countOrders(orderFilterForm);
        output.setData(orderDtos);
        output.setRecordsFiltered(count);
        output.setRecordsTotal(count);
        return output;
    }
}
