package service;

import model.DormitoryFault;
import model.Echarts;

import java.util.List;

public interface DormitoryFaultService {

    int dormitoryFaultInsert(DormitoryFault dormitoryFault);

    List<DormitoryFault> getDormitoryFault(int page,int size);

    int total();

    Integer deleteManyFault(String[] faultids);

    int deletefault(Integer faultId);

    DormitoryFault select_faultId(Integer id);

    void update_fault(DormitoryFault dormitoryFault);

    List<DormitoryFault> select_Attendant(String attendant,int page,int size);

    List<String> getNumber();

    List<Integer> getcount();

    List<String> getNumber1(String dormitory);

    List<Integer> getcount1(String dormitory);

}
