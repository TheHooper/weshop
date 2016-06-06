package com.hooper.hoshop.dto.coupon;

import com.hooper.hoshop.entity.Category;

/**
 * Created by 47123 on 2016/6/6.
 */
public class CouponCatsDto extends Category {

    private String parentName;

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}
