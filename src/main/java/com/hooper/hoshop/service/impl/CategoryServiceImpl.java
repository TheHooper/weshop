package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.dao.CategoryMapper;
import com.hooper.hoshop.dao.GoodsCatMapper;
import com.hooper.hoshop.entity.Category;
import com.hooper.hoshop.entity.GoodsCat;
import com.hooper.hoshop.service.facade.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/5/13.
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    GoodsCatMapper goodsCatMapper;

    @Override
    public List<Category> getRootCategories() {
        List<Category> categories = categoryMapper.selectParents();
        return categories == null ? new ArrayList<Category>() : categories;
    }

    @Override
    public List<Category> getCategoriesByParentId(int parentId, int offset, int limit) {
        List<Category> categories = categoryMapper.selectCategoryByParent(parentId, offset, limit);
        return categories == null ? new ArrayList<Category>() : categories;
    }

    @Override
    public List<Category> getCategoriesByParentId(int parentId) {
        List<Category> categories = categoryMapper.selectCategoryByParent(parentId, null, null);
        return categories == null ? new ArrayList<Category>() : categories;
    }

    @Override
    public int countCategoriesByParentId(int parentId) {
        return categoryMapper.countCategoryByParent(parentId);
    }

    @Override
    public int insert(Category category) {
        if (category != null) {
            try {
                category.setcTime(System.currentTimeMillis());
                category.setuTime(System.currentTimeMillis());
                category.setIsDel(false);
                categoryMapper.insert(category);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int update(Category category) {
        if (category != null) {
            try {
                category.setuTime(System.currentTimeMillis());
                categoryMapper.updateByPrimaryKeySelective(category);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public int delete(Integer id) {
        if (id != null) {
            try {
                Category category = new Category();
                category.setId(id);
                category.setIsDel(true);
                categoryMapper.updateByPrimaryKeySelective(category);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }

    @Override
    public Category selectById(Integer id) {
        return null;
    }

    @Override
    public List<Category> selectList() {
        return null;
    }

    public List<Category> selectList(int offset, int limit) {
        List<Category> categories = categoryMapper.selectAllSecondary(offset, limit);
        return categories == null ? new ArrayList<Category>() : categories;
    }

    @Override
    public int countList() {
        return categoryMapper.countAllSecondary();
    }

    @Override
    public int insertGoodsCat(GoodsCat goodsCat) {
        if (goodsCat != null) {
            try {
                goodsCatMapper.insert(goodsCat);
            } catch (Exception e) {
                throw new BusinessException(AdminErrorConstant.ADMIN_MYSQL_FAILED, "数据库操作失败！" + e.toString());
            }
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "参数为空！");
        }
        return 0;
    }
}
