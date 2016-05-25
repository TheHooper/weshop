package com.hooper.hoshop.entity;

public class GoodsSku {
    private Integer id;

    private String skuId;

    private String skuName;

    private Integer orginalNum;

    private Integer stockNum;

    private Integer saledNum;

    private Integer goodsId;

    private Integer attributeIdA;

    private Integer attributeIdAa;

    private String ext1;

    private String ext2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName == null ? null : skuName.trim();
    }

    public Integer getOrginalNum() {
        return orginalNum;
    }

    public void setOrginalNum(Integer orginalNum) {
        this.orginalNum = orginalNum;
    }

    public Integer getStockNum() {
        return stockNum;
    }

    public void setStockNum(Integer stockNum) {
        this.stockNum = stockNum;
    }

    public Integer getSaledNum() {
        return saledNum;
    }

    public void setSaledNum(Integer saledNum) {
        this.saledNum = saledNum;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getAttributeIdA() {
        return attributeIdA;
    }

    public void setAttributeIdA(Integer attributeIdA) {
        this.attributeIdA = attributeIdA;
    }

    public Integer getAttributeIdAa() {
        return attributeIdAa;
    }

    public void setAttributeIdAa(Integer attributeIdAa) {
        this.attributeIdAa = attributeIdAa;
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1 == null ? null : ext1.trim();
    }

    public String getExt2() {
        return ext2;
    }

    public void setExt2(String ext2) {
        this.ext2 = ext2 == null ? null : ext2.trim();
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GoodsSku{");
        sb.append("attributeIdA=").append(attributeIdA);
        sb.append(", id=").append(id);
        sb.append(", skuId='").append(skuId).append('\'');
        sb.append(", skuName='").append(skuName).append('\'');
        sb.append(", orginalNum=").append(orginalNum);
        sb.append(", stockNum=").append(stockNum);
        sb.append(", saledNum=").append(saledNum);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", attributeIdAa=").append(attributeIdAa);
        sb.append(", ext1='").append(ext1).append('\'');
        sb.append(", ext2='").append(ext2).append('\'');
        sb.append('}');
        return sb.toString();
    }
}