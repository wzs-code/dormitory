package service;


import com.utils.RandomValidateCode;
import mapper.UserMapper;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.SimpleAttributeSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;




    @Override
    public List<User> selectAll() {
        List<User> userList = userMapper.selectAll();
        return userList;
    }

    public User login(String username, String password, String s, HttpServletRequest request){

        HttpSession session = request.getSession();
        String sessionVerifyCode = (String) session.getAttribute("ss");
        User user  = userMapper.select(username);
        if(username.equals(user.getUsername())&&password.equals(user.getPassword())&&s.equals(sessionVerifyCode)){
            return  user;
        }else
            return null;

    }

    @Override
    public int insert(User user) {
        userMapper.insert(user);
        return 1;
    }

    @Override
    public User findUserByUsername(String username) {
        User user  = userMapper.select(username);
        if(username.equals(user.getUsername())){
            return user;
        }else
            return null;
    }

    @Override
    public void update(String username, String password,String password1,String password2) {
        User user = userMapper.select(username);
        user.setPassword(password1);
        userMapper.update(user);
    }

    @Override
    public void updateuser(User user) {
        userMapper.updateAll(user);
    }

    @Override
    public void updatepassword(String username, String password) {
        User user = userMapper.select(username);
        user.setPassword(password);
        userMapper.update(user);
    }


}
