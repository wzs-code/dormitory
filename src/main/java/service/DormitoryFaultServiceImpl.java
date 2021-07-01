package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import mapper.DormitoryFaultMapper;
import model.DormitoryFault;
import model.Echarts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryFaultServiceImpl implements DormitoryFaultService {
    @Autowired
    private DormitoryFaultMapper dormitoryFaultMapper;

    @Override
    public int dormitoryFaultInsert(DormitoryFault dormitoryFault) {
        return dormitoryFaultMapper.insert(dormitoryFault);
    }

    @Override
    public List<DormitoryFault> getDormitoryFault(int page, int size) {
        PageHelper.startPage(page, size);
        return  dormitoryFaultMapper.getDormitoryFault();
    }

    @Override
    public int total() {
        return  dormitoryFaultMapper.getTotal();
    }

    @Override
    public Integer deleteManyFault(String[] faultids) {
        return dormitoryFaultMapper.deleteMany_Fault(faultids);
    }

    @Override
    public int deletefault(Integer faultId) {
        int i = dormitoryFaultMapper.deletefault(faultId);
        return i;
    }

    @Override
    public DormitoryFault select_faultId(Integer faultId) {
        DormitoryFault dormitoryFault = dormitoryFaultMapper.select_fault(faultId);
        return dormitoryFault;
    }

    @Override
    public void update_fault(DormitoryFault dormitoryFault) {
        dormitoryFaultMapper.update_fault(dormitoryFault);
    }

    @Override
    public List<DormitoryFault> select_Attendant(String attendant, int page, int size) {
        Page pages = PageHelper.startPage(page, size);
        List <DormitoryFault> dormitoryFaults = dormitoryFaultMapper.select_Attendant(attendant);
        return  dormitoryFaults;
    }

    @Override
    public List<String> getNumber() {
        List<String> dormitory = dormitoryFaultMapper.getDormitory();
        return dormitory;
    }

    @Override
    public List<Integer> getcount() {
        return  dormitoryFaultMapper.getcount();
    }

    @Override
    public List<String> getNumber1(String dormitory) {
        List<String> dorm = dormitoryFaultMapper.getDorm(dormitory);
        return dorm;
    }

    @Override
    public List<Integer> getcount1(String dormitory) {
        return  dormitoryFaultMapper.getdormcount(dormitory);
    }

}
