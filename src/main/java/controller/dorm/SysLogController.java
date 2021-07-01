package controller.dorm;


import com.github.pagehelper.PageInfo;
import controller.LoginController;
import model.SysLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.SysLogService;

import java.util.List;



@Controller
public class SysLogController {

    @Autowired
    private SysLogService sysLogService;


    @RequestMapping("/findLogger")
    public ModelAndView findAll(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size, Model model) throws Exception {
        int number;
        number = sysLogService.total();
        ModelAndView mv=new ModelAndView();
        List<SysLog> list=sysLogService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageinfo", pageInfo);
        mv.setViewName("admin_logger");
        model.addAttribute("number",number);
        return mv;
    }

    @RequestMapping("/known")
    public ModelAndView konwn(Model model) throws Exception {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("known");
        return mv;
    }

    @RequestMapping("/index")
    public ModelAndView index() throws Exception {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("index");
        return mv;
    }


}