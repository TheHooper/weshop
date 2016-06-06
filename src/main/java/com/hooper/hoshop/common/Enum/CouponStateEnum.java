package com.hooper.hoshop.common.Enum;

/**
 * Created by 47123 on 2016/6/5.
 */
public enum CouponStateEnum {

    UNUSE(0, "未使用"), USED(1, "已使用"), FAED(2, "已过期"),;

    private int value;
    private String intro;

    CouponStateEnum(int value, String intro) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public String getIntro() {
        return intro;
    }

    public static void main(String[] args) {
        System.out.println(GoodsStateEnum.valueOf("PULL_OFF").getValue());
    }
}
