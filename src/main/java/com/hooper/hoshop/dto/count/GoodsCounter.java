package com.hooper.hoshop.dto.count;

import com.hooper.hoshop.entity.Goods;

/**
 * Created by 47123 on 2016/6/6.
 */
public class GoodsCounter extends Goods {

    private Integer counter;

    public Integer getCounter() {
        return counter;
    }

    public void setCounter(Integer counter) {
        this.counter = counter;
    }
}
