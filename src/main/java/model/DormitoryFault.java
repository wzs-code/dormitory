package model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class DormitoryFault {
    private Integer faultId;
    private String dormitory;
    private String dorm;
    private String attendant;
    private String attendantTel;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date fixTime;
    private String fault;
    private Boolean faultStatus;

    public Integer getFaultId() {
        return faultId;
    }

    public void setFaultId(Integer faultId) {
        this.faultId = faultId;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getDorm() {
        return dorm;
    }

    public void setDorm(String dorm) {
        this.dorm = dorm;
    }

    public String getAttendant() {
        return attendant;
    }

    public void setAttendant(String attendant) {
        this.attendant = attendant;
    }

    public String getAttendantTel() {
        return attendantTel;
    }

    public void setAttendantTel(String attendantTel) {
        this.attendantTel = attendantTel;
    }

    public Date getFixTime() {
        return fixTime;
    }

    public void setFixTime(Date fixTime) {
        this.fixTime = fixTime;
    }

    public String getFault() {
        return fault;
    }

    public void setFault(String fault) {
        this.fault = fault;
    }

    public Boolean getFaultStatus() {
        return faultStatus;
    }

    public void setFaultStatus(Boolean faultStatus) {
        this.faultStatus = faultStatus;
    }

}