package com.hooper.hoshop.dto.goods;

import com.hooper.hoshop.entity.GoodsAttr;

/**
 * Created by 47123 on 2016/5/16.
 */
public class GoodsAttrVo extends GoodsAttr {

    private String parentName;

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}
