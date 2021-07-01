package service;

import model.SysLog;

import java.util.List;

public interface SysLogService {
    public void save(SysLog sysLog) throws Exception;

    public List<SysLog> findAll(int page,int size) throws Exception;

   int total();
}
