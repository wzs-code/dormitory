package mapper;

import model.Notice;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface NoticeMapper {
    @Insert("insert into notice (notice,topic,time) values (#{notice},#{topic},#{time})")
    int insert(Notice notice);

    @Select("select * from notice order by time desc")
    List<Notice> selectAll();

    @Select("select * from notice where id =#{id}")
    Notice select(Integer id);

    @Select("select count(*) from notice")
    int selectTotal();
}
