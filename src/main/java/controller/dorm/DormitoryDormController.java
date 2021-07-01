package controller.dorm;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import model.Dormitory;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import service.Dormitory_DormService;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
public class DormitoryDormController {

    @Autowired
    private Dormitory_DormService dormitory_dormService;

    @Autowired
    private StudentService studentService;
    String dormitory;

    @RequestMapping(value = "/dormitory_insert")
    @ResponseBody
    public String inserDormitory(@RequestBody String json) throws Exception {
        Dormitory dormitory = JSONObject.parseObject(json,Dormitory.class);
        System.out.println(dormitory.getDormitory()+dormitory.getDorm());
        List dorms = dormitory_dormService.getDorms(dormitory.getDormitory());
        if(!dorms.isEmpty()){
            for(int i = 0;i<dorms.size();i++){
                if(!(dorms.get(i).equals(dormitory.getDorm()))&&(i==dorms.size()-1)){
                    for(int j=1;j<7;j++){
                        dormitory.setBunk(j+"号床");
                        dormitory_dormService.insert(dormitory);
                    }
                    return "ok";
                }
            }
        }else{
            for(int j=1;j<7;j++){
                dormitory.setBunk(j+"号床");
                dormitory_dormService.insert(dormitory);
            }
            return "ok";
        }
        return "error";

    }


    @RequestMapping("/dormitory")
    public ModelAndView getDorstu_insertmitory(Model model) throws Exception {
        List <String> dormitories = dormitory_dormService.getDormitoies();
        System.out.println(dormitories.toString());
        model.addAttribute("dormitoies",dormitories);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("dormitory");
        return mv;
    }
/*
    @RequestMapping(value = "/getDorm/{pr_name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getDorm(@PathVariable("pr_name")String dormitory) {
        List<Dormitory> dorm = dormitory_dormService.getDorm(dormitory);
        return dorm;
    }*/

    @RequestMapping("/selectdormitory")
    @ResponseBody
    public String getDormitory( @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,HttpServletRequest request) throws Exception {
        dormitory = request.getParameter("dormitory");
        List <Dormitory>dormitories = dormitory_dormService.getDormitorys(dormitory,page,size);
        JSONArray jsonArray = new JSONArray();
        jsonArray.add(dormitories);
        System.out.println(jsonArray.toJSONString());
        return jsonArray.toJSONString();
    }

    @RequestMapping(value="dormitorys")
    @ResponseBody
    public ModelAndView dormitory( @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size) throws IOException {
        List <Dormitory> dormitories = dormitory_dormService.getDormitorys(dormitory,page,size);
        List <Student> students = studentService.selectName(dormitory);
        for (int i = 0;i<dormitories.size();i++) {
            String studentsName = "";
            int index = 0;
            for (Student s:students) {
                index++;
                if(dormitories.get(i).getDorm().equals(s.getDorm().substring(0,4))){
                    if(index==3){
                        studentsName += "<span style=" +"font-weight:700"+">" + s.getSno()+"</span>" +"：" +s.getName()+"<br>";
                    }else
                        studentsName += "<span style=" +"font-weight:700"+">" + s.getSno()+"</span>" +"：" +s.getName()+"&nbsp&nbsp&nbsp";
                }
            }
            dormitories.get(i).setStudent(studentsName);
        }


        for (Dormitory d:dormitories) {
            System.out.println(d.toString());
        }
        PageInfo pageInfo = new PageInfo(dormitories);
        ModelAndView mv=new ModelAndView();
        mv.addObject("dormitorys",pageInfo);
        mv.setViewName("dormitorys");
        return mv;
    }


    @RequestMapping("/dormitoryscenery")
    public ModelAndView getDormitoryScenery(Model model) throws Exception {
        ModelAndView mv=new ModelAndView();
        mv.setViewName("dormitory_scenery");
        return mv;
    }



}
