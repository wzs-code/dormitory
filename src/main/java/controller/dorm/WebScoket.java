package controller.dorm;

import controller.LoginController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class WebScoket {


    @RequestMapping("websocket")
    public ModelAndView websocket(Model model){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("websocket");
        return mv;
    }


}