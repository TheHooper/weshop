package com.hooper.hoshop.web.form;

/**
 * Created by 47123 on 2016/5/23.
 */
public class UserNewPasswordForm {
    private String mobile;
    private String password;
    private String captcha;

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
}
