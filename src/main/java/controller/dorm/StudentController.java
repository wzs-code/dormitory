package controller.dorm;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

import com.utils.ExcelUtil;
import model.*;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.ChinaService;
import service.CollegeService;
import service.Dormitory_DormService;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller

public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private Dormitory_DormService dormitory_dormService;

    @Autowired
    private CollegeService collegeService;

    @Autowired
    private ChinaService chinaService;

    private String dormitory1;
    private String dorm1;
    private String bunk1;


    @RequestMapping("stu_list")
    public ModelAndView show(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,ModelMap map){
        int number;
        List <Student>  students = studentService.selectAll(page, size);
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        List<College> colleges = collegeService.getCollege();
        number = studentService.total();
        PageInfo pageInfo = new PageInfo(students);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageinfo",pageInfo);
        mv.setViewName("stu_list");
        map.addAttribute("dormitorys", dormitory);
        map.addAttribute("colleges", colleges);
        map.addAttribute("number",number);
      /*  model.addAttribute("students",students);*/
        return mv;
    }


    /*两个表关联*/
//    @RequestMapping("/stu_insert")
//    public ModelAndView getDorstu_insertmitory(ModelMap map) throws Exception {
//        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
//        for (Dormitory s:dormitory) {
//            System.out.println(s.getDormitory());
//        }
//        map.addAttribute("dormitorys", dormitory);
//        ModelAndView mv=new ModelAndView();
//        mv.setViewName("stu_insert");
//        return mv;
//    }
//
//    @RequestMapping(value = "/getDorm/{pr_name}",method = RequestMethod.GET)
//    @ResponseBody
//    public Object getDorm(@PathVariable("pr_name")String dormitory) {
//        List<Dorm> dorm = dormitory_dormService.getDorm(dormitory);
//        return dorm;
//    }

    /*一个表关联*/
    @RequestMapping("/stu_insert")
    public ModelAndView getDorstu_insertmitory(ModelMap map) throws Exception {
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        List<College> colleges = collegeService.getCollege();
        List<China> chinas = chinaService.getProvince();
        map.addAttribute("dormitorys", dormitory);
        map.addAttribute("colleges", colleges);
        map.addAttribute("chinas", chinas);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("stu_insert");
        return mv;
    }

    @RequestMapping(value = "/getDorm/{pr_name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getDorm(@PathVariable("pr_name")String dormitory,HttpServletRequest request) throws UnsupportedEncodingException {
        List<Dormitory> dorm = dormitory_dormService.getDorm(dormitory);
        return dorm;
    }

    @RequestMapping(value = "/getBunk",method = RequestMethod.GET)
    @ResponseBody
    public Object getBunk(String dorm,String dormitory) {
        List<Dormitory> bunk = dormitory_dormService.getBunk(dorm,dormitory);

        return bunk;
    }

    @RequestMapping(value = "/getMajor/{name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getMajor(@PathVariable("name")String name) {
        List<College> major = collegeService.getMajor(name);

        return major;
    }

    @RequestMapping(value = "/getClasses/{name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getClasses(@PathVariable("name")String name) {
        List<College> classes = collegeService.getClasses(name);
        return classes;
    }

    @RequestMapping(value = "/getCity/{Name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getCity(@PathVariable("Name")String province) {
        List<China> city = chinaService.getCity(province);

        return city;
    }

    @RequestMapping(value = "/getArea/{Name}",method = RequestMethod.GET)
    @ResponseBody
    public Object getArea(@PathVariable("Name")String city) {
        List<China> area = chinaService.getArea(city);
        return area;
    }

    @RequestMapping("/stu_insertAll")
    public ModelAndView insertStu(@Valid Student student, BindingResult result, Model model,String dormitory,String dorm,String bunk) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        if(result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            modelAndView.addObject("fieldError1", map);
            modelAndView.setViewName("/stu_list");
            return modelAndView;
        }else{

            String sqlPath = null;
            //定义文件保存的本地路径
            String localPath="D:\\File\\";
            //定义 文件名
            String filename=null;
            if(!student.getFile().isEmpty()){
                //生成uuid作为文件名称
                String uuid = UUID.randomUUID().toString().substring(0,5).replaceAll("-","");
                //获得文件类型（可以判断如果不是图片，禁止上传）
                String contentType=student.getFile().getContentType();
                //获得文件后缀名
                String suffixName=contentType.substring(contentType.indexOf("/")+1);
                //得到 文件名
                filename=uuid+"."+suffixName;
                System.out.println(filename);
                //文件保存路径
                student.getFile().transferTo(new File(localPath+filename));

            }
            //把图片的相对路径保存至数据库
            sqlPath = filename;
            System.out.println(sqlPath);
            student.setPhoto(sqlPath);
            student.setDorm(student.getDorm()+bunk);
            studentService.insert(student);
            dormitory_dormService.updateStatus(dormitory,dorm,bunk);
            modelAndView.setViewName("redirect:/stu_list");
            model.addAttribute("student", student);
            return modelAndView;

        }
    }

//
//
//    @RequestMapping("/stu_insertAll")
//    public String insertStu(@Valid Student student,BindingResult result,Model model) throws Exception {
//
//        ModelAndView modelAndView = new ModelAndView();
//
//            String sqlPath = null;
//            //定义文件保存的本地路径
//            String localPath="D:\\File\\";
//            //定义 文件名
//            String filename=null;
//            if(!student.getFile().isEmpty()){
//                //生成uuid作为文件名称
//                String uuid = UUID.randomUUID().toString().substring(0,5).replaceAll("-","");
//                //获得文件类型（可以判断如果不是图片，禁止上传）
//                String contentType=student.getFile().getContentType();
//                //获得文件后缀名
//                String suffixName=contentType.substring(contentType.indexOf("/")+1);
//                //得到 文件名
//                filename=uuid+"."+suffixName;
//                System.out.println(filename);
//                //文件保存路径
//                student.getFile().transferTo(new File(localPath+filename));
//
//            }
//            //把图片的相对路径保存至数据库
//            sqlPath = filename;
//            System.out.println(sqlPath);
//            student.setPhoto(sqlPath);
//            System.out.println(student.getSno());
//            System.out.println(student.getSno());
//            System.out.println(student.getSno());
//            if(student.getSno()==12){
//                studentService.insert(student);
//
//                return "ok";
//            }else
//                return "error";
//
//
//
//    }


    @RequestMapping("delete")
    public String delete(Integer sno){
        Student student = studentService.select_sno(sno);
        String dormitory = student.getDormitory();
        String s = student.getDorm();
        String dorm = s.substring(0,4);
        String bunk = s.substring(4);
        studentService.delete(sno);
        dormitory_dormService.updatebunk(dormitory,dorm,bunk);
        return "redirect:/stu_list";
    }

    @RequestMapping("deleteSelect")
    @ResponseBody
    public String deleteSelect(String ids,Model model){
        System.out.println(ids);
        String[] d=ids.split(",");//把数组里的值逗号隔开
        for(int i=0;i<d.length;i++){
            Student student = studentService.select_sno(Integer.parseInt(d[i]));
            String dormitory = student.getDormitory();
            String s = student.getDorm();
            String dorm = s.substring(0,4);
            String bunk = s.substring(4);
            dormitory_dormService.updatebunk(dormitory,dorm,bunk);
        }
        studentService.deleteMany(d);
        return "ok";//返回给ajax
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(HttpServletRequest req){
        String sno1 = req.getParameter("sno");
        dormitory1 = req.getParameter("dormitory");
        dorm1 = req.getParameter("dorm");
        bunk1 = req.getParameter("bunk");
        Integer sno = Integer.parseInt(sno1);
        Student student= studentService.select_sno(sno);
        JSONObject jsonObject = new JSONObject();
        //将返回的数据放到json对象里面
        jsonObject.put("account",student);
        System.out.println(jsonObject.toJSONString());
        //将json对象转为json字符串返回给前端页面
        return jsonObject.toJSONString();

//        model.addAttribute("sno",sno);
//        return "stu_list1";
    }

    @RequestMapping("updateAll")
    public String updateAll(Student student,String dormitory,String dorm,String bunk) throws Exception {

//        String sqlPath = null;
//        //定义文件保存的本地路径
//        String localPath="D:\\File\\";
//        //定义 文件名
//        String filename=null;
//
//        if(!student.getFile().isEmpty()){
//            //生成uuid作为文件名称
//            String uuid = UUID.randomUUID().toString().substring(0,5).replaceAll("-","");
//            //获得文件类型（可以判断如果不是图片，禁止上传）
//            String contentType=student.getFile().getContentType();
//            //获得文件后缀名
//            String suffixName=contentType.substring(contentType.indexOf("/")+1);
//            //得到 文件名
//            filename=uuid+"."+suffixName;
//            System.out.println(filename);
//            //文件保存路径
//            student.getFile().transferTo(new File(localPath+filename));
//        }
//        //把图片的相对路径保存至数据库
//        sqlPath = filename;
//        System.out.println(sqlPath);
//        student.setPhoto(sqlPath);
        Student student1 = studentService.select_sno(student.getSno());
        student.setDorm(student.getDorm()+bunk);
        studentService.update(student);

        dormitory_dormService.updateStatus(dormitory,dorm,bunk);
        dormitory_dormService.updatebunk(student1.getDormitory(),student1.getDorm().substring(0,4),student1.getDorm().substring(4));
        return "redirect:/stu_list";
    }


    @RequestMapping("select")
    public String select() {
        return "select";
    }

   /* 无分页模式
    @RequestMapping("selectAll")
    public String selectAll(Integer id, Model model){
        System.out.println(id);
        List <Student>  student = studentService.select(id);
        model.addAttribute("lists",student);
        return "list";
    }*/

    @RequestMapping("/selectSno")
    public ModelAndView selectSno(Integer sno,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size,@Valid Student students,BindingResult result){
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        Student student = studentService.selectSno(sno);
        modelAndView.addObject("students", student);
        modelAndView.setViewName("stu_select");
//        model.addAttribute("lists",student);
        return modelAndView;

    }



    @RequestMapping("/selectName")
    public ModelAndView selectName(String name,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size,@Valid Student students,BindingResult result){
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();

            List<Student> student = studentService.selectName(name, page, size);

            PageInfo pageInfo = new PageInfo(student);
            modelAndView.addObject("pageinfo", pageInfo);
            modelAndView.setViewName("stu_list");
//        model.addAttribute("lists",student);
            return modelAndView;
    }

    @RequestMapping("/selectDormitory")
    public ModelAndView selectDormitory(String dormitory,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,@Valid Student students,BindingResult result){
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> map = new HashMap<String,Object>();
        List<Student> student = studentService.selectDorm(dormitory, page, size);
        PageInfo pageInfo = new PageInfo(student);
        modelAndView.addObject("pageinfo", pageInfo);
        modelAndView.setViewName("stu_list");
//        model.addAttribute("lists",student);
        return modelAndView;

    }



/*
    @RequestMapping(value = "/selectone")
    @ResponseBody
    public String selectone(Model model, HttpServletRequest req){
        String sno1 = req.getParameter("sno");
        Integer sno = Integer.parseInt(sno1);
        Student student= studentService.select_sno(sno);

        JSONObject jsonObject = new JSONObject();
        //将返回的数据放到json对象里面
        jsonObject.put("account",student);
        System.out.println(jsonObject.toJSONString());
        //将json对象转为json字符串返回给前端页面
        return jsonObject.toJSONString();

//        model.addAttribute("sno",sno);
//        return "stu_list1";
    }
*/


    @RequestMapping(value = "/selectone")
    @ResponseBody
    public String selectone(Model model, HttpServletRequest req){
        String sno1 = req.getParameter("sno");
        if(!sno1.equals("")){
            Integer sno = Integer.parseInt(sno1);
            Student student= studentService.select_sno(sno);
            if(student.getSno()!=null){
                return "ok";
            }
        }

        return "error";


//        model.addAttribute("sno",sno);
//        return "stu_list1";
    }



    @RequestMapping("export")
    @ResponseBody
    public void export(HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.reset(); //清除buffer缓存
        //Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Content-Disposition","attachment;filename="+new String("用户表.xlsx".getBytes(),"iso-8859-1"));
        //导出Excel对象
        XSSFWorkbook workbook = studentService.exportExcelInfo();
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutput = new BufferedOutputStream(output);
            bufferedOutput.flush();
            workbook.write(bufferedOutput);
            bufferedOutput.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
