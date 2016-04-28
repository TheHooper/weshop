package com.hooper.hoshop.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 47123 on 2016/4/29.
 */
@Controller
@RequestMapping("/v1/goods")
public class GoodController {

    @RequestMapping("/list")
    public String goodsView() {
        return "/goods/goodsList";
    }
}
