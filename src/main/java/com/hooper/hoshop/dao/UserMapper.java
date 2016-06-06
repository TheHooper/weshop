package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.count.UserMoneyDto;
import com.hooper.hoshop.dto.count.UserOrdersDto;
import com.hooper.hoshop.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper extends GenericDao<User, Integer> {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    List<UserMoneyDto> selectUserOrderByCost(@Param("orderType") Integer orderType);

    List<UserOrdersDto> selectUserOrderByOrdersCount(@Param("orderType") Integer orderType);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByMobile(String mobile);

    User selectByOpenId(String openId);

    User selectByName(String name);

    List<User> selectListPaged(Map map);

    int countListPaged(Map map);
}