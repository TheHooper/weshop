package com.hooper.hoshop.web.form;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by 47123 on 2016/5/22.
 */
public class UserRegisterForm {
    @NotBlank(message = "手机、密码不能为空")
    private String mobile;
    @NotBlank(message = "手机、密码不能为空")
    private String password;
    //    @NotBlank(message = "验证码不能为空")
    private String captcha;
    @NotBlank(message = "手机验证码不能为空")
    private String mobileCode;

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobileCode() {
        return mobileCode;
    }

    public void setMobileCode(String mobileCode) {
        this.mobileCode = mobileCode;
    }
}
