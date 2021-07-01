package mapper;

import model.DormitoryFault;
import model.Echarts;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface DormitoryFaultMapper {

    @Insert("insert into dormitoryfault (dormitory,dorm,attendant,attendantTel,fixTime,fault,faultStatus) values (#{dormitory},#{dorm},#{attendant},#{attendantTel},#{fixTime},#{fault},#{faultStatus})")
    int insert(DormitoryFault dormitoryFault);

    @Select("select * from dormitoryfault")
    List<DormitoryFault> getDormitoryFault();

    @Select("select count(*) from dormitoryfault")
    int getTotal();

    int deleteMany_Fault(String[] faultids);

    int deletefault(Integer faultId);

    @Select("select * from dormitoryfault where faultId = #{faultId}")
    DormitoryFault select_fault(Integer faultId);

    @Update("update dormitoryfault set attendant=#{attendant},attendantTel=#{attendantTel},fixTime=#{fixTime},faultStatus=#{faultStatus} where faultId = #{faultId}")
    void update_fault(DormitoryFault dormitoryFault);

    @Select("select * from dormitoryfault where attendant = #{attendant}")
    List<DormitoryFault> select_Attendant(String attendant);

    @Select("select dormitory from dormitoryfault group by dormitory")
    List<String> getDormitory();

    @Select("select count(dormitory) from dormitoryfault group by dormitory")
    List<Integer> getcount();

    @Select("select dorm from dormitoryfault where dormitory=#{dormitory} group by dorm")
    List<String> getDorm(String dormitory);

    @Select("select count(dorm) from dormitoryfault  where dormitory=#{dormitory} group by dorm")
    List<Integer> getdormcount(String dormitory);





}
