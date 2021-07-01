package model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class Principal {
    @Override
    public String toString() {
        return "Principal{" +
                "principalId=" + principalId +
                ", dormitory='" + dormitory + '\'' +
                ", principal='" + principal + '\'' +
                ", principalTel='" + principalTel + '\'' +
                ", principalSex='" + principalSex + '\'' +
                ", duty='" + duty + '\'' +
                ", time=" + time +
                ", leftTime=" + leftTime +
                '}';
    }

    private Integer principalId;
    private String dormitory;
    private String principal;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String password;
    private String principalTel;
    private String principalSex;
    private String duty;
    private String photo;

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private MultipartFile file;
    private String  email;

    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date time;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date leftTime;


    public Integer getPrincipalId() {
        return principalId;
    }

    public void setPrincipalId(Integer principalId) {
        this.principalId = principalId;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getPrincipal() {
        return principal;
    }



    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getPrincipalTel() {
        return principalTel;
    }

    public void setPrincipalTel(String principalTel) {
        this.principalTel = principalTel;
    }

    public String getPrincipalSex() {
        return principalSex;
    }

    public void setPrincipalSex(String principalSex) {
        this.principalSex = principalSex;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getLeftTime() {
        return leftTime;
    }

    public void setLeftTime(Date leftTime) {
        this.leftTime = leftTime;
    }
}
