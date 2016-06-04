package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.AddressMapper;
import com.hooper.hoshop.dao.AreasMapper;
import com.hooper.hoshop.dao.CitiesMapper;
import com.hooper.hoshop.dao.ProvincesMapper;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/28.
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressMapper addressMapper;
    @Autowired
    ProvincesMapper provincesMapper;
    @Autowired
    CitiesMapper citiesMapper;
    @Autowired
    AreasMapper areasMapper;

    @Override
    public List<Provinces> selectProvinces() {
        List<Provinces> result;
        try {
            result = provincesMapper.selectAll();
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Provinces>() : result;
        return result;
    }

    @Override
    public List<Cities> selectByProvincesId(int provincesId) {
        List<Cities> result;
        try {
            result = citiesMapper.selectByProvincesId(provincesId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Cities>() : result;
        return result;
    }

    @Override
    public List<Areas> selectByCitiesId(int citiesId) {
        List<Areas> result;
        try {
            result = areasMapper.selectByCitiesId(citiesId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Areas>() : result;
        return result;

    }

    @Override
    public Zipcode selectByAreaId(int areaId) {
        return null;
    }

    @Override
    public Address selectDefaultAddress(int userId) {
        try {
            return addressMapper.selectDefaultByUserId(userId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public List<Address> selectAddressesByUserId(int userId) {
        try {
            return addressMapper.selectAllByUserId(userId);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void setDefaultAddress(int userId, int addressId) {
        Address oldDefault = addressMapper.selectDefaultByUserId(userId);
        if (oldDefault != null) {
            oldDefault.setIsDefault(false);
            addressMapper.updateByPrimaryKeySelective(oldDefault);
        }
        Address address = addressMapper.selectByPrimaryKey(addressId);
        if (address != null) {
            address.setIsDefault(true);
            addressMapper.updateByPrimaryKeySelective(address);
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_VALID_ERROR, "addressId is illegal");
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void changeDefaultAddress(int oldId, int newId) {
        Address oldDefault = addressMapper.selectByPrimaryKey(oldId);
        if (oldDefault != null) {
            oldDefault.setIsDefault(false);
            addressMapper.updateByPrimaryKeySelective(oldDefault);
            Address newDefault = addressMapper.selectByPrimaryKey(newId);
            if (newDefault != null) {
                newDefault.setIsDefault(true);
                addressMapper.updateByPrimaryKeySelective(newDefault);
            }
        }
    }

    @Override
    public int insert(Address address) {
        if (address != null) {
            address.setIsDefault(false);
            return addressMapper.insertSelective(address);
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error！");
        }
    }

    @Override
    public int update(Address address) {
        try {
            return addressMapper.updateByPrimaryKeySelective(address);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public int delete(Integer id) {
        if (id != null) {
            return addressMapper.deleteByPrimaryKey(id);
        } else {
            throw new BusinessException(WebErrorConstant.PARAM_NULL, "param null error！");
        }
    }

    @Override
    public Address selectById(Integer id) {
        try {
            return addressMapper.selectByPrimaryKey(id);
        } catch (Exception e) {
            throw new BusinessException(WebErrorConstant.MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
    }

    @Override
    public List<Address> selectList() {
        return null;
    }
}
