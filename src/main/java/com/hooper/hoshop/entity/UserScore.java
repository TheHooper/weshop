package com.hooper.hoshop.entity;

public class UserScore {
    private Integer id;

    private Integer userId;

    private Integer score;

    private Integer balanceScore;

    private Byte type;

    private Boolean streamType;

    private Long cTime;

    private byte[] sn;

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

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getBalanceScore() {
        return balanceScore;
    }

    public void setBalanceScore(Integer balanceScore) {
        this.balanceScore = balanceScore;
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

    public byte[] getSn() {
        return sn;
    }

    public void setSn(byte[] sn) {
        this.sn = sn;
    }
}