package com.hooper.hoshop.dto.coupon;

/**
 * Created by 47123 on 2016/6/7.
 */
public class CouponCounter {
    private int unuse;
    private int used;
    private int fade;

    public int getFade() {
        return fade;
    }

    public void setFade(int fade) {
        this.fade = fade;
    }

    public int getUnuse() {
        return unuse;
    }

    public void setUnuse(int unuse) {
        this.unuse = unuse;
    }

    public int getUsed() {
        return used;
    }

    public void setUsed(int used) {
        this.used = used;
    }
}
