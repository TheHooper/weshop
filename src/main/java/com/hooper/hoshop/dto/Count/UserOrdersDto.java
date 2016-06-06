package com.hooper.hoshop.dto.count;

import com.hooper.hoshop.entity.User;

/**
 * Created by 47123 on 2016/6/5.
 */
public class UserOrdersDto extends User {

    private Integer orderCount;

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }
}
