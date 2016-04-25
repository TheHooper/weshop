package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.dao.UserMapper;
import com.hooper.hoshop.entity.User;
import com.hooper.hoshop.service.facade.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 47123 on 2016/3/19.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;


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
    public User selectOne() {
        return null;
    }

    @Override
    public List<User> selectList() {
        return null;
    }
}
