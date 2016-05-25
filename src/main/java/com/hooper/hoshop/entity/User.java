package com.hooper.hoshop.entity;

public class User {
    private Integer id;

    private String userName;

    private String password;

    private String passwordRandom;

    private Boolean gender;

    private String mobile;

    private String email;

    private String avatar;

    private Boolean vip;

    private Integer score;

    private Long cTime;

    private Long lastLoginTime;

    private String lastLoginIp;

    private Boolean isDel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPasswordRandom() {
        return passwordRandom;
    }

    public void setPasswordRandom(String passwordRandom) {
        this.passwordRandom = passwordRandom == null ? null : passwordRandom.trim();
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public Boolean getVip() {
        return vip;
    }

    public void setVip(Boolean vip) {
        this.vip = vip;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Long getcTime() {
        return cTime;
    }

    public void setcTime(Long cTime) {
        this.cTime = cTime;
    }

    public Long getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Long lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp == null ? null : lastLoginIp.trim();
    }

    public Boolean getIsDel() {
        return isDel;
    }

    public void setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("avatar='").append(avatar).append('\'');
        sb.append(", id=").append(id);
        sb.append(", userName='").append(userName).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", passwordRandom='").append(passwordRandom).append('\'');
        sb.append(", gender=").append(gender);
        sb.append(", mobile='").append(mobile).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", vip=").append(vip);
        sb.append(", score=").append(score);
        sb.append(", cTime=").append(cTime);
        sb.append(", lastLoginTime=").append(lastLoginTime);
        sb.append(", lastLoginIp='").append(lastLoginIp).append('\'');
        sb.append(", isDel=").append(isDel);
        sb.append('}');
        return sb.toString();
    }
}