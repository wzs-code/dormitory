package model;

public class Dormitory {
    public Dormitory() {
    }

    private Integer id;
    private  String dormitory;
    private  String dorm;
    private String bunk;
    private Integer status;
    private String equipment;
    private String site;

    @Override
    public String toString() {
        return "Dormitory{" +
                "id=" + id +
                ", dormitory='" + dormitory + '\'' +
                ", dorm='" + dorm + '\'' +
                ", bunk='" + bunk + '\'' +
                ", status=" + status +
                ", equipment='" + equipment + '\'' +
                ", site='" + site + '\'' +
                ", leader='" + leader + '\'' +
                ", student='" + student + '\'' +
                '}';
    }

    private String leader;
    private String student;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getBunk() {
        return bunk;
    }

    public void setBunk(String bunk) {
        this.bunk = bunk;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getStudent() {
        return student;
    }

    public void setStudent(String student) {
        this.student = student;
    }
}
