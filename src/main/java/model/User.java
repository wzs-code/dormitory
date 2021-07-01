package model;

import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.Date;

public class User {

    private Integer id;

    private String username;

    private String password;

    private String role;

    private String sex;

    private String telephone;

    private String photo;

    private MultipartFile file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String name) {
        this.username = name == null ? null : name.trim();
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

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


    private String validatacode;
    private Timestamp outdate;
    public String getValidatacode() {
        return validatacode;
    }

    public void setValidatacode(String validatacode) {
        this.validatacode = validatacode;
    }
    public Date getOutdate() {
        return outdate;
    }

    public void setOutdate(Timestamp outdate) {
        this.outdate = outdate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    private String  email;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", sex='" + sex + '\'' +
                ", telephone='" + telephone + '\'' +
                ", photo='" + photo + '\'' +
                ", file=" + file +
                ", validatacode='" + validatacode + '\'' +
                ", outdate=" + outdate +
                ", email='" + email + '\'' +
                '}';
    }
}