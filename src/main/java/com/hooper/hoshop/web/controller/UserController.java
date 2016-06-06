package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.ValidUtil;
import com.hooper.hoshop.common.util.security.BASE64;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.UserService;
import com.hooper.hoshop.service.impl.CustomGenericManageableCaptchaService;
import com.hooper.hoshop.web.form.UserLoginForm;
import com.hooper.hoshop.web.form.UserRegisterForm;
import com.octo.captcha.service.image.ImageCaptchaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * Created by 47123 on 2016/3/19.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    UserService userService;

    @Autowired
    private CustomGenericManageableCaptchaService customGenericManageableCaptchaService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginView() {
        return "entry/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput login(@Valid UserLoginForm userLoginForm, BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, result.getFieldErrors().get(0).getDefaultMessage());
        }
//        Boolean isResponseCorrect = customGenericManageableCaptchaService.validateResponseForID(request.getSession().getId(), userLoginForm.getCaptcha());
//        if (isResponseCorrect) {
            String mobile = BASE64.decrypt(userLoginForm.getMobile());
            String password = BASE64.decrypt(userLoginForm.getPassword());
            userLoginForm.setMobile(mobile);
            userLoginForm.setPassword(password);
            User user = userService.checkUserByMobile(userLoginForm);
            if (user != null) {
                request.getSession().setAttribute(WebConstant.SESSION_SIGNIN_USER, user);
            } else {
                throw new BusinessException(WebErrorConstant.AUTH_USER_ERROR, "手机或密码错误!");
            }
            JsonOutput output = new JsonOutput();
            return output;
//        } else {
//            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "验证码错误!");
//        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerView() {
        return "entry/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public JsonOutput register(@Valid UserRegisterForm registerForm, BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, result.getFieldErrors().get(0).getDefaultMessage());
        }
//        Boolean isResponseCorrect = customGenericManageableCaptchaService.validateResponseForID(request.getSession().getId(), registerForm.getCaptcha());
//        if (isResponseCorrect) {
            String mobile = BASE64.decrypt(registerForm.getMobile());
            if (!ValidUtil.isMobile(mobile)) {
                throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "手机格式有误");
            }
            String smsCode = (String) request.getSession().getAttribute(WebConstant.SESSION_SMS_CODE);
            if (smsCode == null || !registerForm.getMobileCode().equals(smsCode)) {
                throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "手机验证码有误");
            }
            String password = BASE64.decrypt(registerForm.getPassword());
            if (password.length() > 16 || password.length() < 6) {
                throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "密码长度要在6~16个字符范围内");
            }
            registerForm.setMobile(mobile);
            registerForm.setPassword(password);
            customGenericManageableCaptchaService.removeCaptcha(request.getSession().getId());
            request.getSession().removeAttribute(WebConstant.SESSION_SMS_CODE);
            userService.register(registerForm);
            User user = userService.selectByMobile(mobile);
            request.getSession().setAttribute(WebConstant.SESSION_SIGNIN_USER, user);

            JsonOutput output = new JsonOutput();
            return output;
//        } else {
//            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "验证码错误!");
//        }
    }

    @RequestMapping(value = "/forgetPassword", method = {RequestMethod.GET})
    public String forgetPasswordView() {
        return "entry/forgetPassword";
    }


    @RequestMapping(value = "/forgetPassword", method = {RequestMethod.POST})
    public String forgetPassword() {
        return "entry/forgetPassword";
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/central", method = {RequestMethod.POST, RequestMethod.GET})
    public String central() {
        return "user/central";
    }

    @UserLoginAnnotation
    @RequestMapping("carts")
    public String shoppingCarts() {
        return "/user/carts";
    }

    @UserLoginAnnotation
    @RequestMapping("orders")
    public String ordersView() {
        return "/user/orders";
    }

    @UserLoginAnnotation
    @RequestMapping("coupon")
    public String couponView() {
        return "/user/coupon";
    }
}
