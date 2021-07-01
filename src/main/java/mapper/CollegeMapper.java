package mapper;

import model.College;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CollegeMapper {

    @Select("select * from college where parentid = 0")
    List<College> getCollege();


    @Select("select * from college where parentid = (select sonid from college where name = #{college})")
    List <College> getMajor(String college);


    @Select("select * from college where parentid = (select sonid from college where name = #{major})")
    List <College> getClasses(String major);




}
