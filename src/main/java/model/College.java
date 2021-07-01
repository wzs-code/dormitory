package model;

public class College {

    private Integer parentid;
    private Integer sonid;
    private String name;

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getSonid() {
        return sonid;
    }

    public void setSonid(Integer sonid) {
        this.sonid = sonid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
