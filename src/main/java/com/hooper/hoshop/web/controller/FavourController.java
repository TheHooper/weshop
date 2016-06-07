package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.Goods;
import com.hooper.hoshop.entity.GoodsFavour;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.impl.GoodsFavourServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 47123 on 2016/6/7.
 */
@Controller
@RequestMapping("/favour")
public class FavourController {

    @Resource
    GoodsFavourServiceImpl goodsFavourService;

    @UserLoginAnnotation
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Goods> getList(HttpSession session, Integer offset, Integer limit) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        return goodsFavourService.selectFavourByUserId(user.getId(), offset, limit);
    }

    @RequestMapping(value = "/single", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    GoodsFavour select(Integer goodsId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        if (user != null) {
            return goodsFavourService.selectByUserIdAndGoods(user.getId(), goodsId);
        } else {
            throw new BusinessException(WebErrorConstant.UN_LOGIN_FAVOUR, "登录之后才能收藏哟");
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput add(Integer goodsId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        if (user != null) {
            GoodsFavour goodsFavour = new GoodsFavour();
            goodsFavour.setUserId(user.getId());
            goodsFavour.setGoodsId(goodsId);
            goodsFavourService.insert(goodsFavour);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(WebErrorConstant.UN_LOGIN_FAVOUR, "登录之后才能收藏哟");
        }
    }


    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput del(Integer goodsId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        if (user != null) {
            goodsFavourService.delete(user.getId(), goodsId);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(WebErrorConstant.UN_LOGIN_FAVOUR, "登录之后才能收藏哟");
        }

    }
}
