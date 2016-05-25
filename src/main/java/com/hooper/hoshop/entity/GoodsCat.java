package com.hooper.hoshop.entity;

public class GoodsCat {
    private Integer id;

    private Integer goodsId;

    private Integer cats;

    private Integer catsParentId;

    private String catsName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getCats() {
        return cats;
    }

    public void setCats(Integer cats) {
        this.cats = cats;
    }

    public Integer getCatsParentId() {
        return catsParentId;
    }

    public void setCatsParentId(Integer catsParentId) {
        this.catsParentId = catsParentId;
    }

    public String getCatsName() {
        return catsName;
    }

    public void setCatsName(String catsName) {
        this.catsName = catsName == null ? null : catsName.trim();
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GoodsCat{");
        sb.append("cats=").append(cats);
        sb.append(", id=").append(id);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", catsParentId=").append(catsParentId);
        sb.append(", catsName='").append(catsName).append('\'');
        sb.append('}');
        return sb.toString();
    }
}