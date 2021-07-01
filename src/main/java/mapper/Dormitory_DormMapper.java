package mapper;



import model.Dorm;
import model.Dormitory;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface Dormitory_DormMapper {

    @Insert("insert into dormitory (dormitory,dorm,bunk,status,equipment,site,leader) values (#{dormitory},#{dorm},#{bunk},#{status},#{equipment},#{site},#{leader})")
    int insert(Dormitory dormitory);

    @Select("select dormitory from dormitory group by dormitory")
    List <String> getDormitoies();


    @Select("select * from dormitory group by dormitory")
    List <Dormitory> getDormitory();

    @Select("select * from dormitory where dormitory = #{dormitory} group by dorm")
    List <Dormitory> getDormitorys(String dormitory);

//    @Select("select * from dorm d join dormitory s on d.fatherID=s.dormitoryID where dormitory = #{dormitory}")
//    public List <Dorm> getDorm(String dormitory);

    @Select("select dorm from dormitory where dormitory = #{dormitory} group by dorm")
    List <String> getDorms(String dormitory);


    @Select("select * from dormitory where dormitory = #{dormitory} and status = 0 group by dorm")
    List <Dormitory> getDorm(String dormitory);


    @Select("select * from dormitory where dorm = #{0} and dormitory = #{1} and status = 0")
    List <Dormitory> getBunk(String dorm,String dormitory);

    @Update("update dormitory set status = 1 where dormitory=#{0} and dorm=#{1} and bunk = #{2}")
    void updateStatus(String dormitory, String dorm, String bunk);

    @Update("update dormitory set status = 0 where dormitory=#{0} and dorm=#{1} and bunk = #{2}")
    void updatebunk(String dormitory, String dorm, String bunk);




}
