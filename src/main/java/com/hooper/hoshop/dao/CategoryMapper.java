package com.hooper.hoshop.dao;

import com.hooper.hoshop.dto.count.CatsCounter;
import com.hooper.hoshop.dto.coupon.CouponCatsDto;
import com.hooper.hoshop.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper extends GenericDao<Category, Integer> {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> selectParents();

    List<Category> selectCategoryByParent(@Param(value = "parentId") Integer parentId, @Param(value = "offset") Integer offset, @Param(value = "limit") Integer limit);

    int countCategoryByParent(@Param(value = "parentId") Integer parentId);

    List<Category> selectAllSecondary(@Param(value = "offset") int offset, @Param(value = "limit") int limit);

    int countAllSecondary();

    Integer countCostCatsParent(@Param("id") int id);

    Integer countNumCatsParent(@Param("id") int id);

    List<CatsCounter> countCostByCats(@Param("id") int id);

    List<CatsCounter> countNumByCats(@Param("id") int id);

    List<CouponCatsDto> selectByCouponsId(@Param("id") Integer id);
}