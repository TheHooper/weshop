package com.hooper.hoshop.entity;

public class GoodsAttr {
    private Integer id;

    private Integer goodsId;

    private Integer attrId;

    private String attrName;

    private Integer parentId;

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

    public Integer getAttrId() {
        return attrId;
    }

    public void setAttrId(Integer attrId) {
        this.attrId = attrId;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName == null ? null : attrName.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GoodsAttr{");
        sb.append("attrId=").append(attrId);
        sb.append(", id=").append(id);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", attrName='").append(attrName).append('\'');
        sb.append(", parentId=").append(parentId);
        sb.append('}');
        return sb.toString();
    }
}