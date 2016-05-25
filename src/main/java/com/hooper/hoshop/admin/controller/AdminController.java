package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.AdminLoginForm;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.constant.AdminConstants;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.entity.Admin;
import com.hooper.hoshop.service.facade.AdminService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by 47123 on 2016/5/12.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    private final static Logger logger = Logger.getLogger(AdminController.class);

    @Resource
    AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute(new AdminLoginForm());
        return "admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginIn(@Valid AdminLoginForm adminLoginForm, BindingResult result, HttpSession session, HttpServletResponse response) {
        if (result.hasErrors()) {
            return "admin/login";
        }
        Admin admin;
        try {
            admin = adminService.login(adminLoginForm);
            session.setAttribute(AdminConstants.SESSION_SIGNIN_ADMIN, adminLoginForm);
            return "admin/index";
        } catch (BusinessException e) {
            if (AdminErrorConstant.ADMIN_NOT_FOUND.equals(e.getCode())) {
                logger.warn("用户帐号不存在");
                result.addError(new FieldError("adminLoginForm", "username", "用户帐号不存在"));
            } else {
                logger.warn("用户密码不正确");
                result.addError(new FieldError("adminLoginForm", "password", "用户密码不正确"));
            }
            return "admin/login";
        }
    }


    @RequestMapping("/index")
    public String home() {
        return "admin/index";
    }
}
