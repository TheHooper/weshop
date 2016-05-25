package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.AdminLoginForm;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.security.MD5;
import com.hooper.hoshop.dao.AdminMapper;
import com.hooper.hoshop.entity.Admin;
import com.hooper.hoshop.service.facade.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 47123 on 2016/5/13.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin login(AdminLoginForm adminLoginForm) {
        Admin admin = adminMapper.selectByName(adminLoginForm.getUsername());
        if (admin == null) {
            throw new BusinessException(AdminErrorConstant.ADMIN_NOT_FOUND, "用户名不存在");
        }
        String password = adminLoginForm.getPassword() + admin.getSalt();
        password = MD5.encrypt(password);
        if (password.equals(admin.getPassword())) {
            return admin;
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PASS_ERROR, "用户名密码错误");
        }
    }
}
