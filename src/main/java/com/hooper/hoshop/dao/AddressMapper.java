package com.hooper.hoshop.dao;

import com.hooper.hoshop.entity.Address;

import java.util.List;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    List<Address> selectAllByUserId(Integer id);

    Address selectDefaultByUserId(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}