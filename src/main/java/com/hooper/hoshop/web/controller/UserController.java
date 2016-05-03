package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by 47123 on 2016/3/19.
 */
@Controller
@RequestMapping(value = "/v1/user")
public class UserController {

    @Resource
    UserService userService;

    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginView() {
        return "entry/login";
    }

    @RequestMapping(value = "/register", method = {RequestMethod.POST, RequestMethod.GET})
    public String registerView() {
        return "entry/register";
    }

    @RequestMapping(value = "/forgetPassword", method = {RequestMethod.POST, RequestMethod.GET})
    public String forgetPasswordView() {
        return "entry/forgetPassword";
    }

    @RequestMapping(value = "/central", method = {RequestMethod.POST, RequestMethod.GET})
    public String central() {
        return "user/central";
    }
}
