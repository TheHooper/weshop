package com.hooper.hoshop.entity;

public class UserVip {
    private Integer id;

    private Integer userId;

    private Integer vipScore;

    private Integer vipBalanceScore;

    private Byte type;

    private Boolean streamType;

    private Long cTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getVipScore() {
        return vipScore;
    }

    public void setVipScore(Integer vipScore) {
        this.vipScore = vipScore;
    }

    public Integer getVipBalanceScore() {
        return vipBalanceScore;
    }

    public void setVipBalanceScore(Integer vipBalanceScore) {
        this.vipBalanceScore = vipBalanceScore;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Boolean getStreamType() {
        return streamType;
    }

    public void setStreamType(Boolean streamType) {
        this.streamType = streamType;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }
}