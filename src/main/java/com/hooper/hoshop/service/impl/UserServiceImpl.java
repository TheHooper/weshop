package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.admin.form.UserFilterForm;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.BeanToMapUtil;
import com.hooper.hoshop.common.util.CodeUtil;
import com.hooper.hoshop.common.util.security.BASE64;
import com.hooper.hoshop.common.util.security.MD5;
import com.hooper.hoshop.dao.UserMapper;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.UserService;
import com.hooper.hoshop.web.form.UserLoginForm;
import com.hooper.hoshop.web.form.UserRegisterForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by 47123 on 2016/3/19.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public int register(UserRegisterForm userRegisterForm) {
        if (userRegisterForm != null) {
            try {
                User user = new User();
                String mobile = userRegisterForm.getMobile();
                String password = userRegisterForm.getPassword();
                String salt = CodeUtil.getUserPasswordSalt();
                String MD5psw = MD5.encrypt(password + salt);
                user.setMobile(mobile);
                user.setPassword(MD5psw);
                user.setPasswordRandom(salt);
                user.setcTime(System.currentTimeMillis());
                user.setIsDel(false);
                if (userRegisterForm.getOpenId() != null) {
                    user.setOpenId(userRegisterForm.getOpenId());
                }
                if (userRegisterForm.getNickname() != null) {
                    user.setUserName(userRegisterForm.getNickname());
                }
                if (userRegisterForm.getHeadImgUrl() != null) {
                    user.setAvatar(userRegisterForm.getHeadImgUrl());
                }
                return userMapper.insert(user);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error");
        }
    }

    @Override
    public int insert(User user) {
        return 0;
    }

    @Override
    public int update(User user) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public User selectById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User selectByMobile(String mobile) {
        if (mobile != null && !"".equals(mobile)) {
            try {
                return userMapper.selectByMobile(mobile);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error");
        }
    }

    @Override
    public User selectByName(String name) {
        if (name != null && !"".equals(name)) {
            try {
                return userMapper.selectByName(name);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error");
        }
    }

    @Override
    public User selectByOpenId(String openId) {
        if (openId != null && !"".equals(openId)) {
            try {
                return userMapper.selectByOpenId(openId);
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error");
        }
    }

    @Override
    public List<User> selectList() {

        return null;
    }

    public User checkUserByMobile(UserLoginForm userLoginForm) {
        if (userLoginForm.getMobile() != null && !"".equals(userLoginForm.getMobile())) {
            try {
                User user = userMapper.selectByMobile(userLoginForm.getMobile());
                if (user == null) {
                    return null;
                }
                String formPassword = MD5.encrypt(userLoginForm.getPassword() + user.getPasswordRandom());
                if (user.getPassword().equals(formPassword)) {
                    return user;
                } else {
                    return null;
                }
            } catch (Exception e) {
                throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error");
        }
    }

    @Override
    public List<User> selectList(UserFilterForm userFilterForm, int offset, int limit) {
        List<User> result = null;
        try {
            Map params = BeanToMapUtil.convertBean(userFilterForm);
            params.put("offset", offset);
            params.put("limit", limit);
            result = userMapper.selectListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<User>() : result;
        return result;
    }

    @Override
    public int countList(UserFilterForm userFilterForm) {
        try {
            Map params = BeanToMapUtil.convertBean(userFilterForm);
            return userMapper.countListPaged(params);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }
}
