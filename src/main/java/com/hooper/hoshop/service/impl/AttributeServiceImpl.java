package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.AttributeMapper;
import com.hooper.hoshop.entity.Attribute;
import com.hooper.hoshop.service.facade.AttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
@Service
public class AttributeServiceImpl implements AttributeService {

    @Autowired
    AttributeMapper attributeMapper;

    @Override
    public List<Attribute> selectParents() {
        List<Attribute> result = null;
        try {
            result = attributeMapper.selectParents();
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Attribute>() : result;
        return result;
    }

    @Override
    public List<Attribute> selectChildren(int parentId) {
        List<Attribute> result = null;
        try {
            result = attributeMapper.selectChildren(parentId);
        } catch (Exception e) {
            throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
        }
        result = result == null ? new ArrayList<Attribute>() : result;
        return result;
    }

    @Override
    public void insertParent(Attribute attribute) {
        if (attribute != null) {
            attribute.setParentId(0);
            attribute.setcTime(System.currentTimeMillis());
            attribute.setIsDel(false);
            try {
                attributeMapper.insert(attribute);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
    }

    @Override
    public void insertChild(Attribute attribute) {
        if (attribute != null) {
            attribute.setcTime(System.currentTimeMillis());
            attribute.setIsDel(false);
            try {
                attributeMapper.insert(attribute);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
    }

    @Override
    public int insert(Attribute attribute) {
        return 0;
    }

    @Override
    public int update(Attribute attribute) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return 0;
    }

    @Override
    public Attribute selectById(Integer id) {
        return null;
    }

    @Override
    public List selectList() {
        return null;
    }
}
