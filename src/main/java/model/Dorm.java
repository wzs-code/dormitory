package model;

import org.springframework.transaction.annotation.Transactional;

public class Dorm {
    private Integer id;
    private Integer dormID;
    private  String dorm;
    private  String fatherID;


    public Dorm(){
        System.out.println("无参构造函数");
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDormID() {
        return dormID;
    }

    public void setDormID(Integer dormID) {
        this.dormID = dormID;
    }

    public String getDorm() {
        return dorm;
    }

    public void setDorm(String dorm) {
        this.dorm = dorm;
    }

    public String getFatherID() {
        return fatherID;
    }

    public void setFatherID(String fatherID) {
        this.fatherID = fatherID;
    }


}
