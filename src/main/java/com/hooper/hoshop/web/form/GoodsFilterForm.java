package com.hooper.hoshop.web.form;

/**
 * Created by 47123 on 2016/5/20.
 */
public class GoodsFilterForm {

    private String title;

    private Integer catId;

    private Integer time;//0 or 1

    private Integer price;//0 or 1

    private Integer sold;//0 or 1

    private Integer orderType;//0 asc or 1 desc

    private Integer limit;

    private Integer offset;

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getSold() {
        return sold;
    }

    public void setSold(Integer sold) {
        this.sold = sold;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GoodsFilterForm{");
        sb.append("catId=").append(catId);
        sb.append(", title='").append(title).append('\'');
        sb.append(", time=").append(time);
        sb.append(", price=").append(price);
        sb.append(", sold=").append(sold);
        sb.append(", orderType=").append(orderType);
        sb.append(", limit=").append(limit);
        sb.append(", offset=").append(offset);
        sb.append('}');
        return sb.toString();
    }
}
