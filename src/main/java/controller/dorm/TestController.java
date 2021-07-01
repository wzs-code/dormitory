package controller.dorm;

import model.User;
import org.springframework.ui.Model;
import service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller

public class TestController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public String test(Model model){
        List<User> userList = userService.selectAll();
        for (User user:userList){
            System.out.println(user.getId()+"+"+user.getUsername()+"+"+user.getPassword()+"+"+user.getTelephone());
        }
        model.addAttribute("list",userList);
        return "test";
    }
}