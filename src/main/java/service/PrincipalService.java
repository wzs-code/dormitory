package service;

import model.Principal;

import java.util.List;

public interface PrincipalService {

    int principalInsert(Principal principal);


    List<Principal> getPrincipal(int page, int size);

    int total();

    Integer deleteManyPrincipal(String[] principalIds);

    int deletePrincipal(Integer faultId);

    Principal select_principalId(Integer principalId);

    void update_principal(Principal principal);

    List<Principal> select_principal(String principal,int page,int size);

}
