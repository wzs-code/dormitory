package service;

import model.Visitor;

import java.util.List;

public interface VisitorService {

    List<Visitor> getVisitor(int page,int size);

    int total();

    Integer deleteMany_visitor(String[] visitorids);

    int insert_visitor(Visitor visitor);

    int delete_visitor(Integer id);

    void update_visitor(Visitor visitor);

    List<Visitor> select_visitorname(String visitor_name,int page,int size);

    Visitor select_id(Integer id);

}
