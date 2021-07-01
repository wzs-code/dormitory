package controller.dorm;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.pagehelper.PageInfo;
import mapper.DormitoryFaultMapper;
import model.Dormitory;
import model.DormitoryFault;
import model.Echarts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.DormitoryFaultServiceImpl;
import service.Dormitory_DormService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class DormitoryFaultController {

    @Autowired
    private DormitoryFaultServiceImpl dormitoryFaultService;

    @Autowired
    private Dormitory_DormService dormitory_dormService;

    @RequestMapping("dormitoryfault_insert")
    public ModelAndView dormitoryFaultInsert(DormitoryFault dormitoryFault){
        System.out.println(dormitoryFault);
        dormitoryFaultService.dormitoryFaultInsert(dormitoryFault);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/dormitoryFaultInformation");
        return mv;
    }

    @RequestMapping("dormitoryFaultInformation")
    public ModelAndView getDormitoryFaultShow(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size, Model model,ModelMap map){
        int number;
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        map.addAttribute("dormitorys", dormitory);
        List<DormitoryFault> dormitoryFaultList  = dormitoryFaultService.getDormitoryFault(page, size);
        number = dormitoryFaultService.total();
        PageInfo pageInfo = new PageInfo(dormitoryFaultList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dormitoryFaults",pageInfo);
        modelAndView.setViewName("dormitoryfault");
        model.addAttribute("number",number);
        return modelAndView;
    }

    @RequestMapping("deletedormitroyfault")
    @ResponseBody
    public String deleteSelect(String faultids){
        System.out.println(faultids);
        String[] d=faultids.split(",");//把数组里的值逗号隔开
        dormitoryFaultService.deleteManyFault(d);
        return "ok";//返回给ajax
    }


    @RequestMapping("deletefault")
    public String delete(Integer faultId){
        dormitoryFaultService.deletefault(faultId);
        return "redirect:/dormitoryFaultInformation";
    }

    @RequestMapping(value = "/update_faultId")
    @ResponseBody
    public String update(HttpServletRequest req){
        String faultIds = req.getParameter("faultId");
        Integer faultId = Integer.parseInt(faultIds);
        DormitoryFault dormitoryFault = dormitoryFaultService.select_faultId(faultId);

        JSONObject jsonObject = new JSONObject();
        //将返回的数据放到json对象里面
        jsonObject.put("account",dormitoryFault);
        System.out.println(jsonObject.toJSONString());
        //将json对象转为json字符串返回给前端页面
        return jsonObject.toJSONString();
    }


    @RequestMapping("dormitoryfault_update")
    public String updateAll(DormitoryFault dormitoryFault) throws Exception {
        dormitoryFaultService.update_fault(dormitoryFault);
        return "redirect:/dormitoryFaultInformation";
    }

    @RequestMapping("/selectAttendant")
    public ModelAndView selectName(String attendant,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size,Model model){
        int number;
        number = dormitoryFaultService.total();
        ModelAndView modelAndView = new ModelAndView();
        List<DormitoryFault> dormitoryFaults = dormitoryFaultService.select_Attendant(attendant, page, size);
        PageInfo pageInfo = new PageInfo(dormitoryFaults);
        model.addAttribute("number",number);
        modelAndView.addObject("dormitoryFaults", pageInfo);
        modelAndView.setViewName("dormitoryfault");
        return modelAndView;
    }


    @RequestMapping("statistical")
    public ModelAndView getStatistical(ModelMap map){
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        ModelAndView modelAndView = new ModelAndView() ;
        map.addAttribute("dormitorys", dormitory);
        modelAndView.setViewName("echarts");
        return modelAndView;
    }


    @RequestMapping("static")
    @ResponseBody
    public List<Echarts> Faultstatistic() {
        List<String> getname = dormitoryFaultService.getNumber();
        List<Integer> getcount = dormitoryFaultService.getcount();
        List <Echarts> result = new ArrayList<>();
        for(int i=0;i<getcount.size();i++){
            Echarts e = new Echarts();
            e.setDormitory(getname.get(i));
            e.setCount(getcount.get(i));
            result.add(e);
        }
        return result;
    }

    @RequestMapping(value = "/getdorms/{dormitory}",method = RequestMethod.GET)
    @ResponseBody
    public List<Echarts> getdorm(@PathVariable("dormitory")  String dormitory) {
        List<String> getname = dormitoryFaultService.getNumber1(dormitory);
        List<Integer> getcount = dormitoryFaultService.getcount1(dormitory);
        List <Echarts> result = new ArrayList<>();
        for(int i=0;i<getcount.size();i++){
            Echarts e = new Echarts();
            e.setDormitory(getname.get(i));
            e.setCount(getcount.get(i));
            result.add(e);
        }
        return result;
    }



    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


}
