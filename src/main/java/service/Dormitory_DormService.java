package service;




import model.Dormitory;

import java.util.List;

public interface Dormitory_DormService {

    int insert(Dormitory dormitory);

    List<Dormitory> getDormitory();

    List<String> getDormitoies();

    List<Dormitory> getDormitorys(String dormitory,int page,int size);

    List<Dormitory> getDorm(String dormitory);

    List<String> getDorms(String dormitory);

    List<Dormitory> getBunk(String dorm,String dormitory);

    void updateStatus(String dormitory,String dorm,String bunk);

    void updatebunk(String dormitory,String dorm,String bunk);

}
