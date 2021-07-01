package service;

import model.Notice;

import java.util.List;

public interface NoticeService {

    int insertNotice(Notice notice);

    List<Notice> selectAll(int page,int size);

    Notice select(Integer id);

    int total();
}
