package mapper;

import model.Visitor;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface VisitorMapper {

    @Select("select * from visitor")
    List<Visitor> getVisitor();

    @Select("select count(*) from visitor")
    int gettotal();

    int deleteMany_visitor(String [] visitorids);

//    @Select("select * from dorm d join dormitory s on d.fatherID=s.dormitoryID where dormitory = #{dormitory}")
//    public List <Visitor> getDorm(String dormitory);

    int insert_visitor(Visitor visitor);

    int delete_visitor(Integer id);

    void update_visitor(Visitor visitor);

    List<Visitor> select_visitorname(String visitor_name);

    Visitor select_visitorid(Integer id);

}
