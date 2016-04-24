package com.hooper.hoshop.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by 47123 on 2016/3/19.
 */
@Controller
@RequestMapping(value = "/v1/user")
public class UserController {


    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginView() {
        System.out.println("====>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        return "index";
    }
}
