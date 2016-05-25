package com.hooper.hoshop.admin.form;

import org.hibernate.validator.constraints.NotBlank;

public class AdminLoginForm {
    private String username;
    private String password;
    private boolean remember;

    @NotBlank(message = "用户名不能为空")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @NotBlank(message = "密码不能为空")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    @Override
    public String toString() {
        return "AdminLoginForm{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", remember=" + remember +
                '}';
    }
}
