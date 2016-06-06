package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.CodeUtil;
import com.hooper.hoshop.common.util.ValidUtil;
import com.hooper.hoshop.common.util.security.BASE64;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.service.facade.SmsService;
import com.hooper.hoshop.service.impl.CustomGenericManageableCaptchaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by 47123 on 2016/5/23.
 */
@Controller
@RequestMapping("/sms")
public class SmsController {

    @Resource
    SmsService duanXinBaoSmsService;

    @Autowired
    private CustomGenericManageableCaptchaService customGenericManageableCaptchaService;

    @RequestMapping("/sendCode")
    public
    @ResponseBody
    JsonOutput sendSms(HttpServletRequest request, String mobile, String captcha) {
//        Boolean isResponseCorrect = customGenericManageableCaptchaService.validateResponseForID(request.getSession().getId(), captcha);
//        if (isResponseCorrect) {
            if (mobile != null && !"".equals(mobile)) {
                mobile = BASE64.decrypt(mobile);
                if (ValidUtil.isMobile(mobile)) {
                    String code = CodeUtil.getSmsCode();
                    duanXinBaoSmsService.sendSms(mobile, duanXinBaoSmsService.getRegisterTemplate(code));
                    request.getSession().setAttribute(WebConstant.SESSION_SMS_CODE, code);
                    JsonOutput output = new JsonOutput();
                    return output;
                } else {
                    throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "手机格式有误");
                }
            } else {
                throw new BusinessException(WebErrorConstant.PARAM_NULL, "未获取到手机号");
            }
//        } else {
//            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "验证码错误!");
//        }
    }
}
