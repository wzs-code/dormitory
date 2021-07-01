package service;


import model.College;


import java.util.List;

public interface CollegeService {

    List<College> getCollege();

    List<College> getMajor(String college);

    List<College> getClasses(String major);



}
