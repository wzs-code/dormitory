package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import mapper.VisitorMapper;
import model.Visitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisitorServiceImpl implements VisitorService{

    @Autowired
    private VisitorMapper visitorMapper;

    @Override
    public List<Visitor> getVisitor(int page,int size) {
        Page pages = PageHelper.startPage(page, size);
        return  visitorMapper.getVisitor();
    }
    @Override
    public int total() {
        return visitorMapper.gettotal();
    }

    @Override
    public Integer deleteMany_visitor(String[] visitorids) {
        return visitorMapper.deleteMany_visitor(visitorids);
    }

    @Override
    public int insert_visitor(Visitor visitor){
        int i = visitorMapper.insert_visitor(visitor);
        return i;
    }

    @Override
    public int delete_visitor(Integer id) {
        int i = visitorMapper.delete_visitor(id);
        return i;
    }

    @Override
    public void update_visitor(Visitor visitor) {
        visitorMapper.update_visitor(visitor);
    }


    @Override
    public List<Visitor> select_visitorname(String visitor_name, int page, int size) {
        Page pages = PageHelper.startPage(page, size);
        List <Visitor> visitors = visitorMapper.select_visitorname(visitor_name);
        return  visitors;
    }

    @Override
    public Visitor select_id(Integer id) {
        Visitor visitor = visitorMapper.select_visitorid(id);
        return visitor;
    }
}
