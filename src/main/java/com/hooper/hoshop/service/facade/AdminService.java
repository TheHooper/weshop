package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.AdminLoginForm;
import com.hooper.hoshop.dao.AdminMapper;
import com.hooper.hoshop.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 47123 on 2016/5/12.
 */

public interface AdminService {

    Admin login(AdminLoginForm adminLoginForm);
}
