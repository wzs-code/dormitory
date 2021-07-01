package mapper;

import model.China;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ChinaMapper {

    @Select("select * from china where Pid = 0")
    List<China> getProvince();


    @Select("select * from china where Pid = (select Id from china where Name = #{province})")
    List<China> getCity(String province);


    @Select("select * from china where Pid = (select Id from china where Name = #{city})")
    List <China> getArea(String city);


}
