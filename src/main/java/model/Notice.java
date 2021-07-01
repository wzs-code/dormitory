package model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Notice {

    private Integer id;
    private String notice;
    private String topic;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private Date time;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}
