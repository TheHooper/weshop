package com.hooper.hoshop.entity;

public class Role {
    private Integer id;

    private String name;

    private Long authorities;

    private Integer cTime;

    private Integer uTime;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getAuthorities() {
        return authorities;
    }

    public void setAuthorities(Long authorities) {
        this.authorities = authorities;
    }

    public Integer getcTime() {
        return cTime;
    }

    public void setcTime(Integer cTime) {
        this.cTime = cTime;
    }

    public Integer getuTime() {
        return uTime;
    }

    public void setuTime(Integer uTime) {
        this.uTime = uTime;
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
}