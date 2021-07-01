package controller.dorm;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import controller.LoginController;
import model.Dormitory;
import model.Visitor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.Dormitory_DormService;
import service.VisitorService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class VisitorController {
    @Autowired
    private VisitorService visitorService;
    @Autowired
    private Dormitory_DormService dormitory_dormService;

    @RequestMapping("visitor")
    public ModelAndView getVisitor(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size, Model model,ModelMap map){
        int number;
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        map.addAttribute("dormitorys", dormitory);

        List<Visitor> visitors  = visitorService.getVisitor(page, size);
        number = visitorService.total();
        PageInfo pageInfo = new PageInfo(visitors);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("visitors",pageInfo);
        modelAndView.setViewName("visitor");
        model.addAttribute("number",number);
        return modelAndView;
    }

    @RequestMapping("deleteVisitorSelect")
    @ResponseBody
    public String deleteSelect(String visitorids,Model model){
        System.err.println(visitorids);
        String[] d=visitorids.split(",");//把数组里的值逗号隔开
        visitorService.deleteMany_visitor(d);
        return "ok";//返回给ajax
    }



    @RequestMapping("/visitor_insert")
    public ModelAndView insertStu(@Valid Visitor visitor, BindingResult result, Model model) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        System.out.println();
        Map<String,Object> map = new HashMap<String,Object>();
//        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date time = null;
//        String str=":00";
//        time = sdf.parse(visitor_cometime.replace("T"," ")+str);
//        visitor.setVisitor_cometime(time);
        if(result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            modelAndView.addObject("fieldError1", map);
            modelAndView.setViewName("/visitor");
            return modelAndView;
        }else{
            visitor.setVisitor_dormitory(visitor.getVisitor_dormitory()+visitor.getVisitor_dorm());
            visitorService.insert_visitor(visitor);
            modelAndView.setViewName("redirect:/visitor");
            model.addAttribute("visitor", visitor);
            return modelAndView;

        }
    }

    @RequestMapping(value = "/update_visitor_id")
    @ResponseBody
    public String update(HttpServletRequest req){
        String visitor_id = req.getParameter("id");
        Integer id = Integer.parseInt(visitor_id);
        Visitor visitor= visitorService.select_id(id);
        JSONObject jsonObject = new JSONObject();
        //将返回的数据放到json对象里面
        jsonObject.put("account",visitor);
        System.out.println(jsonObject.toJSONString());
        //将json对象转为json字符串返回给前端页面
        return jsonObject.toJSONString();
    }

    @RequestMapping("update_visitor")
    public String updateAll( Visitor visitor) throws Exception {
        System.out.println(visitor.toString());
        System.out.println(visitor.toString());
        System.out.println(visitor.toString());
        visitorService.update_visitor(visitor);
        return "redirect:/visitor";
    }

    @RequestMapping("update_visitors")
    public String updateAlls( Visitor visitor,HttpServletRequest req) throws Exception {
        System.out.println(req.getParameter("id"));
        visitor.setId(Integer.parseInt(req.getParameter("id")));
        System.out.println(visitor.toString());
        System.out.println(visitor.toString());
        System.out.println(visitor.toString());
        visitorService.update_visitor(visitor);
        return "redirect:/visitor";
    }

    @RequestMapping("delete_visitor")
    public String delete(Integer id){
        visitorService.delete_visitor(id);
        return "redirect:/visitor";
    }

    @RequestMapping("/select_visitorname")
    public ModelAndView selectName(String visitor_name,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size,Model model){
        int number;
        number = visitorService.total();
        ModelAndView modelAndView = new ModelAndView();
        List<Visitor> visitors = visitorService.select_visitorname(visitor_name, page, size);
        PageInfo pageInfo = new PageInfo(visitors);
        model.addAttribute("number",number);
        modelAndView.addObject("visitors", pageInfo);
        modelAndView.setViewName("visitor");
        return modelAndView;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

}
