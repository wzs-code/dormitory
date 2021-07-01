package model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Visitor {

    private  Integer id;

    @Override
    public String toString() {
        return "Visitor{" +
                "id=" + id +
                ", visitor_name='" + visitor_name + '\'' +
                ", visit_studentname='" + visit_studentname + '\'' +
                ", visitor_relation='" + visitor_relation + '\'' +
                ", visitor_reason='" + visitor_reason + '\'' +
                ", visitor_telephone='" + visitor_telephone + '\'' +
                ", visitor_cometime=" + visitor_cometime +
                ", visitor_leavetime=" + visitor_leavetime +
                '}';
    }

    private String visitor_name;

    private String visitor_dormitory;

    private String visitor_dorm;

    private String visit_studentname;

    private String visitor_relation;

    private String visitor_reason;

    private String visitor_telephone;

    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date visitor_cometime;

    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date visitor_leavetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVisitor_name() {
        return visitor_name;
    }

    public void setVisitor_name(String visitor_name) {
        this.visitor_name = visitor_name;
    }

    public String getVisitor_dormitory() {
        return visitor_dormitory;
    }

    public void setVisitor_dormitory(String visitor_dormitory) {
        this.visitor_dormitory = visitor_dormitory;
    }

    public String getVisitor_dorm() {
        return visitor_dorm;
    }

    public void setVisitor_dorm(String visitor_dorm) {
        this.visitor_dorm = visitor_dorm;
    }

    public String getVisit_studentname() {
        return visit_studentname;
    }

    public void setVisit_studentname(String visit_studentname) {
        this.visit_studentname = visit_studentname;
    }

    public String getVisitor_relation() {
        return visitor_relation;
    }

    public void setVisitor_relation(String visitor_relation) {
        this.visitor_relation = visitor_relation;
    }

    public String getVisitor_reason() {
        return visitor_reason;
    }

    public void setVisitor_reason(String visitor_reason) {
        this.visitor_reason = visitor_reason;
    }

    public String getVisitor_telephone() {
        return visitor_telephone;
    }

    public void setVisitor_telephone(String visitor_telephone) {
        this.visitor_telephone = visitor_telephone;
    }

    public Date getVisitor_cometime() {
        return visitor_cometime;
    }

    public void setVisitor_cometime(Date visitor_cometime) {
        this.visitor_cometime = visitor_cometime;
    }

    public Date getVisitor_leavetime() {
        return visitor_leavetime;
    }

    public void setVisitor_leavetime(Date visitor_leavetime) {
        this.visitor_leavetime = visitor_leavetime;
    }

}
