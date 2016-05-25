package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.Category;
import com.hooper.hoshop.entity.GoodsCat;

import java.util.List;

/**
 * Created by 47123 on 2016/5/13.
 */
public interface CategoryService extends GenericService<Category, Integer> {

    List<Category> getRootCategories();

    List<Category> getCategoriesByParentId(int parentId, int offset, int limit);

    List<Category> getCategoriesByParentId(int parentId);

    int countCategoriesByParentId(int parentId);

    List<Category> selectList(int offset, int limit);

    int countList();

    int insertGoodsCat(GoodsCat goodsCat);
}
