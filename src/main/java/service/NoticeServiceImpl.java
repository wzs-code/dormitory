package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import mapper.NoticeMapper;
import model.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public int insertNotice(Notice notice) {
        return noticeMapper.insert(notice);
    }

    @Override
    public List<Notice> selectAll(int page, int size) {
        PageHelper.startPage(page, size);
        List <Notice> sysLogs = noticeMapper.selectAll();
        return sysLogs;
    }


    @Override
    public Notice select(Integer id) {
        return noticeMapper.select(id);
    }

    @Override
    public int total() {
        int number = noticeMapper.selectTotal();
        return number;
    }
}
