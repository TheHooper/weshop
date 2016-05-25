package com.hooper.hoshop.dto.Goods;

import com.hooper.hoshop.entity.Goods;

/**
 * Created by 47123 on 2016/5/19.
 */
public class GoodsCatVo extends Goods {

    private Integer catsId;

    public Integer getCatsId() {
        return catsId;
    }

    public void setCatsId(Integer catsId) {
        this.catsId = catsId;
    }
}
