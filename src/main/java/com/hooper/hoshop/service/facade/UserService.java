package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.admin.form.UserFilterForm;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.web.form.UserLoginForm;
import com.hooper.hoshop.web.form.UserRegisterForm;

import java.util.List;

/**
 *
 * Created by 47123 on 2016/3/19.
 */
public interface UserService extends GenericService<User, Integer> {

    public int register(UserRegisterForm userRegisterForm);

    public User selectByMobile(String mobile);

    public User selectByName(String name);

    public User checkUserByMobile(UserLoginForm userLoginForm);

    public List<User> selectList(UserFilterForm userFilterForm, int offset, int limit);

    public int countList(UserFilterForm userFilterForm);
}
