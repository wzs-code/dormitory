package model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.util.Date;

public class Student {

    @NotNull(message = "{sno不能为空}")
    private Integer sno;
    private String name;
    private String sex;
    private String dormitory;
    private String dorm;
    private String telephone;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date entrance_time;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date graduation_time;

    private  String emergency_contact_person;
    private String emergency_contact_number;
    private String photo;
    private MultipartFile file;

    private String college;
    private String major;
    private String classes;

    private String teacher;
    private String province;
    private String city;
    private String area;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date birthday;
    private Integer age;
    private String introduction;
    private String Idcard;
    private String nation;
    private String politicalOutlook;




    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getEntrance_time() {
        return entrance_time;
    }

    public void setEntrance_time(Date entrance_time) {
        this.entrance_time = entrance_time;
    }

    public Date getGraduation_time() {
        return graduation_time;
    }

    public void setGraduation_time(Date graduation_time) {
        this.graduation_time = graduation_time;
    }

    public String getEmergency_contact_person() {
        return emergency_contact_person;
    }

    public void setEmergency_contact_person(String emergency_contact_person) {
        this.emergency_contact_person = emergency_contact_person;
    }

    public String getEmergency_contact_number() {
        return emergency_contact_number;
    }

    public void setEmergency_contact_number(String emergency_contact_number) {
        this.emergency_contact_number = emergency_contact_number;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }


    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIdcard() {
        return Idcard;
    }

    public void setIdcard(String idcard) {
        Idcard = idcard;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPoliticalOutlook() {
        return politicalOutlook;
    }

    public void setPoliticalOutlook(String politicalOutlook) {
        this.politicalOutlook = politicalOutlook;
    }



}