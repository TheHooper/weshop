package com.hooper.hoshop.common.Enum;

/**
 * Created by 47123 on 2016/5/19.
 */
public enum GoodsStateEnum {

    PULL_OFF(0, "未上架"), SALEING(1, "销售中"), SALD_OUT(2, "售罄"),;

    private int value;
    private String intro;

    GoodsStateEnum(int value, String intro) {
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
