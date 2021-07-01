package service;

import com.github.pagehelper.PageHelper;
import mapper.PrincipalMapper;
import model.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrincipalServiceImpl implements PrincipalService{

    @Autowired
    private PrincipalMapper principalMapper;

    @Override
    public int principalInsert(Principal principal) {
        return principalMapper.insert(principal);
    }

    @Override
    public List<Principal> getPrincipal(int page, int size) {
        PageHelper.startPage(page, size);
        return principalMapper.getPrincipal();
    }

    @Override
    public int total() {
        return principalMapper.getTotal();
    }

    @Override
    public Integer deleteManyPrincipal(String[] principalIds) {
        return principalMapper.deleteMany_principal(principalIds);
    }

    @Override
    public int deletePrincipal(Integer principalId) {
        return principalMapper.delete(principalId);
    }

    @Override
    public Principal select_principalId(Integer principalId) {
        return principalMapper.select_principalId(principalId);
    }

    @Override
    public void update_principal(Principal principal) {
        principalMapper.update_principalId(principal);
    }

    @Override
    public List<Principal> select_principal(String principal, int page, int size) {
        return principalMapper.select_principal(principal);
    }


}
