package mapper;

import model.Principal;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface PrincipalMapper {

    @Insert("insert into principal (dormitory,principal,password,principalTel,principalSex,duty,time,photo,email) values (#{dormitory},#{principal},#{password},#{principalTel},#{principalSex},#{duty},#{time},#{photo},#{email})")
    int insert(Principal principal);

    @Select("select * from principal")
    List <Principal> getPrincipal();

    @Select("select count(*) from principal")
    int getTotal();


    int deleteMany_principal(String[] principalIds);

    @Delete("delete from principal where principalId =#{principalId}")
    int delete(Integer principalId);

    @Select("select * from principal where principalId = #{principalId}")
    Principal select_principalId(Integer principalId);

    @Update("update principal set leftTime=#{leftTime} where principalId = #{principalId}")
    void update_principalId(Principal principal);

    @Select("select * from principal where principal = #{principal}")
    List<Principal> select_principal(String principal);
}


