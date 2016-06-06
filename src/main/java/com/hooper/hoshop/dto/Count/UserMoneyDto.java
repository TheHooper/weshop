package com.hooper.hoshop.dto.count;

import com.hooper.hoshop.entity.User;

import java.math.BigDecimal;

/**
 * Created by 47123 on 2016/6/5.
 */
public class UserMoneyDto extends User {

    private BigDecimal costSum;

    public BigDecimal getCostSum() {
        return costSum;
    }

    public void setCostSum(BigDecimal costSum) {
        this.costSum = costSum;
    }
}
