package com.hooper.hoshop.web.form;

/**
 * Created by 47123 on 2016/6/2.
 */
public class OrderFilterForm {

    private String sn;

    private Integer state;

    private Integer userId;

    private Long startTime;

    private Long endTime;

    private Integer limit;

    private Integer offset;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OrderFilterForm{");
        sb.append("endTime=").append(endTime);
        sb.append(", sn='").append(sn).append('\'');
        sb.append(", state=").append(state);
        sb.append(", userId=").append(userId);
        sb.append(", startTime=").append(startTime);
        sb.append(", limit=").append(limit);
        sb.append(", offset=").append(offset);
        sb.append('}');
        return sb.toString();
    }
}
