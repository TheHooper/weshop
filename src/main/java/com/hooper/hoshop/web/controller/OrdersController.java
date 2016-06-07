package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.common.util.security.BASE64;
import com.hooper.hoshop.common.util.security.MD5;
import com.hooper.hoshop.dto.coupon.UserCouponDto;
import com.hooper.hoshop.dto.order.OrderDto;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.*;
import com.hooper.hoshop.web.form.*;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/9.
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    OrderService orderService;

    @Resource
    GoodsService goodsService;

    @Resource
    AddressService addressService;

    @Resource
    UserService userService;

    @Resource
    RateService rateService;

    @Resource
    CouponService couponService;

    @UserLoginAnnotation
    @RequestMapping(value = "/checkout", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView checkout(ModelAndView modelAndView, HttpSession session) {
        modelAndView = new ModelAndView("orders/comfirm");
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        Map orderAndGoods = orderService.checkoutFromCarts(user.getId());
        modelAndView.addObject("orderGoodses", orderAndGoods.get("orderGoods"));
        modelAndView.addObject("order", orderAndGoods.get("order"));
        return modelAndView;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/buy", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView buyNow(GoodsCheckoutForm goodsCheckoutForm, ModelAndView modelAndView, HttpSession session) {
        modelAndView = new ModelAndView("orders/comfirm");
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        Map orderAndGoods = orderService.checkout(goodsCheckoutForm, user.getId());
        List<OrderGoods> orderGoodses = new ArrayList<>();
        orderGoodses.add((OrderGoods) orderAndGoods.get("orderGoods"));
        modelAndView.addObject("orderGoodses", orderGoodses);
        modelAndView.addObject("order", orderAndGoods.get("order"));
        return modelAndView;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/buy/{orderId}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView buyNowRe(@PathVariable int orderId, ModelAndView modelAndView, HttpSession session) {
        modelAndView = new ModelAndView("orders/comfirm");
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        Order order = orderService.selectById(orderId);
        List<OrderGoods> orderGoodses = orderService.selectOrderGoodsByOrderId(orderId);
        modelAndView.addObject("order", order);
        modelAndView.addObject("orderGoodses", orderGoodses);
        return modelAndView;
    }

    @RequestMapping(value = "/cancel", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    JsonOutput cancel(int orderId) {
        orderService.delete(orderId);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/orders", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    List<OrderDto> getOrders(OrderFilterForm orderFilterForm, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        orderFilterForm.setUserId(user.getId());
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
        return orderDtos;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/detail/{orderId}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView getDetail(@PathVariable int orderId, ModelAndView modelAndView) {
        Order order = orderService.selectById(orderId);
        Address address = addressService.selectById(order.getAddressId());
        List<OrderGoods> orderGoodses = orderService.selectOrderGoodsByOrderId(orderId);
        UserCouponDto userCouponDto = null;
        if (order.getCouponsId() != null) {
            userCouponDto = couponService.selectUserCouponById(order.getCouponsId());
        }
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
        System.out.println(order.toString());
        System.out.println(orderDto.toString());
        //coupon judege coupon id first
        modelAndView = new ModelAndView("user/ordersDetail");
        modelAndView.addObject("order", orderDto);
        modelAndView.addObject("coupon", userCouponDto);
        modelAndView.addObject("address", address);
        modelAndView.addObject("orderGoodses", orderGoodses);
        return modelAndView;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/pay", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    JsonOutput pay(@Valid OrderPayForm orderPayForm, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, result.getFieldErrors().get(0).getDefaultMessage());
        }
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        String realPassword = BASE64.decrypt(orderPayForm.getPassword());
        if (user.getPassword().equals(MD5.encrypt(realPassword + user.getPasswordRandom()))) {
            orderService.pay(orderPayForm, user.getId());
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(WebErrorConstant.AUTH_USER_ERROR, "密码错误!");
        }
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/receive", method = {RequestMethod.POST, RequestMethod.GET})
    public
    @ResponseBody
    JsonOutput receive(int orderId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        orderService.receive(orderId, user.getId());
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/rate/{orderId}", method = {RequestMethod.GET})
    public ModelAndView toRateView(@PathVariable int orderId, ModelAndView modelAndView) {
        List<OrderGoods> orderGoodses = orderService.selectOrderGoodsByOrderId(orderId);
        modelAndView = new ModelAndView("/orders/rate");
        modelAndView.addObject("orderGoodses", orderGoodses);
        modelAndView.addObject("orderId", orderId);
        return modelAndView;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/rate", method = {RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput toRate(RateListForm rateListForm, HttpSession session) {
        List<Rate> userRates = new ArrayList<>();
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        String name;
        if (user.getUserName() != null && !"".equals(user.getUserName())) {
            name = user.getUserName();
        } else {
            name = user.getMobile();
        }
        for (RateForm rateForm : rateListForm.getRateFormList()) {
            Rate rate = new Rate();
            BeanUtils.copyProperties(rateForm, rate);
            rate.setUserId(user.getId());
            rate.setUsername(name);
            userRates.add(rate);
        }
        if (userRates.size() > 0) {
            rateService.rateOrder(userRates);
            orderService.rated(userRates.get(0).getOrderId(), user.getId());
        }
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/paid", method = {RequestMethod.POST, RequestMethod.GET})
    public String toPaidView() {
        return "orders/paid";
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/checkoutError", method = {RequestMethod.POST, RequestMethod.GET})
    public String toCheckOurErrorView() {
        return "orders/checkoutError";
    }
}
