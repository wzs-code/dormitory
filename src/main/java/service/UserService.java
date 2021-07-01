package service;

import model.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {
    List <User> selectAll();

    User login(String username, String password, String s, HttpServletRequest request);

    int insert(User user);

    User findUserByUsername(String username);

    void update(String username, String password,String password1,String password2);

    void updateuser(User user);

    void updatepassword(String username,String password);
}
