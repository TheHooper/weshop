package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.CartGoods;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.CartsService;
import com.hooper.hoshop.web.form.CartAddForm;
import com.hooper.hoshop.web.form.CartBatchModifyForm;
import com.hooper.hoshop.web.form.CartModifyForm;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/25.
 */
@Controller
@RequestMapping("/carts")
public class CartsController {

    @Resource
    CartsService cartsService;

    @UserLoginAnnotation
    @RequestMapping(value = "/get", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<CartGoods> getByUserId(HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        return cartsService.selectListByUserId(user.getId());
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput insertGoodsToCarts(@Valid CartAddForm cartAddForm, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, result.getFieldError().getDefaultMessage());
        }
        CartGoods cartGoods = new CartGoods();
        BeanUtils.copyProperties(cartAddForm, cartGoods);
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        cartGoods.setUserId(user.getId());
        cartsService.insert(cartGoods);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput updateCartsGoods(@Valid @RequestBody List<CartModifyForm> cartModifyForms, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, result.getFieldError().getDefaultMessage());
        }
        List<CartGoods> cartGoodsList = new ArrayList<>();
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        for (CartModifyForm cartModifyForm : cartModifyForms) {
            CartGoods cartGoods = new CartGoods();
            BeanUtils.copyProperties(cartModifyForm, cartGoods);
            cartGoods.setUserId(user.getId());
            cartGoodsList.add(cartGoods);
        }
        cartsService.update(cartGoodsList);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput delCartsGoods(Integer id) {
        if (id == null) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "null param error");
        }
        cartsService.delete(id);
        JsonOutput output = new JsonOutput();
        return output;
    }


}
