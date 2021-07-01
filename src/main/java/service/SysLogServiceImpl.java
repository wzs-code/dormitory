package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import mapper.SysLogMapper;
import model.Student;
import model.SysLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements SysLogService{
    @Autowired
    private SysLogMapper sysLogMapper;

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogMapper.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(int page,int size) throws Exception {
        Page pages = PageHelper.startPage(page, size);
        List <SysLog> sysLogs = sysLogMapper.findAll();
        return sysLogs;
    }
    @Override
    public int total() {
        int number = sysLogMapper.selectTotal();
        return number;
    }

}
