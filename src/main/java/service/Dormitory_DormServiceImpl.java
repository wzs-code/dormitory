package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import mapper.Dormitory_DormMapper;
import model.Dorm;
import model.Dormitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Dormitory_DormServiceImpl implements Dormitory_DormService{

    @Autowired
    private Dormitory_DormMapper dormitory_dorm;

    @Override
    public int insert(Dormitory dormitory) {
        return dormitory_dorm.insert(dormitory);
    }

    @Override
    public List<Dormitory> getDormitory() {
        return dormitory_dorm.getDormitory();
    }

    @Override
    public List<String> getDormitoies() {
        return dormitory_dorm.getDormitoies();
    }

    @Override
    public List<Dormitory> getDormitorys(String dormitory,int page,int size) {
        Page pages = PageHelper.startPage(page, size);
        return dormitory_dorm.getDormitorys(dormitory);
    }

    @Override
    public List<Dormitory> getDorm(String dormitory) {
        return dormitory_dorm.getDorm(dormitory);
    }

    @Override
    public List<String> getDorms(String dormitory) {
        return dormitory_dorm.getDorms(dormitory);
    }

    @Override
    public List<Dormitory> getBunk(String dorm,String dormitory) {
        return dormitory_dorm.getBunk(dorm,dormitory);
    }

    @Override
    public void updateStatus(String dormitory, String dorm, String bunk) {
        dormitory_dorm.updateStatus(dormitory,dorm,bunk);
    }



    @Override
    public void updatebunk(String dormitory, String dorm, String bunk) {
        dormitory_dorm.updatebunk(dormitory,dorm,bunk);
    }


}
