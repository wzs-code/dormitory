package service;

import mapper.CollegeMapper;
import model.College;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeMapper collegemapper;

    @Override
    public List<College> getCollege() {
        return collegemapper.getCollege();
    }

    @Override
    public List<College> getMajor(String college) {
        return collegemapper.getMajor(college);
    }

    @Override
    public List<College> getClasses(String major) {
        return collegemapper.getClasses(major);
    }
}
