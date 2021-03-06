package controller.dorm;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import model.Dormitory;
import model.Principal;
import model.Student;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.Dormitory_DormService;
import service.PrincipalService;
import service.StudentService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class PrincipalController {

    @Autowired
    private PrincipalService principalService;

    @Autowired
    private UserService userService;

    @Autowired
    private Dormitory_DormService dormitory_dormService;


    @RequestMapping("principal")
    public ModelAndView getPrincipal(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size, Model model, ModelMap map){
        int number;
        List<Dormitory> dormitory = dormitory_dormService.getDormitory();
        map.addAttribute("dormitorys", dormitory);
        List<Principal> principalList = principalService.getPrincipal(page, size);
        number = principalService.total();
        PageInfo pageInfo = new PageInfo(principalList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("principals",pageInfo);
        modelAndView.setViewName("principal");
        model.addAttribute("number",number);
        return modelAndView;
    }

    @RequestMapping("principal_insert")
    public ModelAndView principalInsert(@Valid Principal principal, Model model) throws IOException {
        System.out.println(principal.toString());

        User user = new User();
        String sqlPath = null;
        //?????????????????????????????????
        String localPath = "D:\\File\\";
        //?????? ?????????
        String filename = null;
        if (!principal.getFile().isEmpty()) {//??????uuid??????????????????
            String uuid = UUID.randomUUID().toString().substring(0, 5).replaceAll("-", "");
            //?????????????????????????????????????????????????????????????????????
            String contentType = principal.getFile().getContentType();
            //?????????????????????
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
            //?????? ?????????
            filename = uuid + "." + suffixName;
            System.out.println(filename);
            //??????????????????
            principal.getFile().transferTo(new File(localPath + filename));
        }
        //??????????????????????????????????????????
        sqlPath = filename;
        principal.setPhoto(sqlPath);
        principalService.principalInsert(principal);
        user.setUsername(principal.getPrincipal());
        user.setPassword(principal.getPassword());
        user.setSex(principal.getPrincipalSex());
        user.setRole("?????????");
        user.setTelephone(principal.getPrincipalTel());
        user.setPhoto(sqlPath);
        user.setEmail(principal.getEmail());
        userService.insert(user);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/principal");
        model.addAttribute("dormitoryFault", principal);
        return mv;
    }

    @RequestMapping("principal_delete")
    public String delete(Integer principalId){
        principalService.deletePrincipal(principalId);
        return "redirect:/principal";
    }

    @RequestMapping(value = "/update_principal")
    @ResponseBody
    public String update(HttpServletRequest req){
        String principalIds = req.getParameter("principalId");
        Integer principalId = Integer.parseInt(principalIds);
        Principal principal = principalService.select_principalId(principalId);
        JSONObject jsonObject = new JSONObject();
        //????????????????????????json????????????
        jsonObject.put("account",principal);
        System.out.println(jsonObject.toJSONString());
        //???json????????????json??????????????????????????????
        return jsonObject.toJSONString();
    }


    @RequestMapping("principalUpdate")
    public String updateAll(Principal principal) throws Exception {
        principalService.update_principal(principal);
        return "redirect:/principal";
    }

    @RequestMapping("deleteprincipals")
    @ResponseBody
    public String deleteSelect(String principalIds){
        String[] d=principalIds.split(",");//??????????????????????????????
        principalService.deleteManyPrincipal(d);
        return "ok";//?????????ajax
    }

    @RequestMapping("/selectPrincipal")
    public ModelAndView selectName(String principal,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size,Model model){
        int number;
        number = principalService.total();
        ModelAndView modelAndView = new ModelAndView();
        List<Principal> principalList = principalService.select_principal(principal, page, size);
        PageInfo pageInfo = new PageInfo(principalList);
        model.addAttribute("number",number);
        modelAndView.addObject("principals", pageInfo);
        modelAndView.setViewName("principal");
        return modelAndView;
    }

/*



    @RequestMapping("delete_principal")
    public String delete(Integer faultId){
        dormitoryFaultService.deletefault(faultId);
        return "redirect:/dormitoryFaultInformation";
    }

    @RequestMapping(value = "/update_principal")
    @ResponseBody
    public String update(HttpServletRequest req){
        String faultIds = req.getParameter("faultId");
        Integer faultId = Integer.parseInt(faultIds);
        DormitoryFault dormitoryFault = dormitoryFaultService.select_faultId(faultId);

        JSONObject jsonObject = new JSONObject();
        //????????????????????????json????????????
        jsonObject.put("account",dormitoryFault);
        System.out.println(jsonObject.toJSONString());
        //???json????????????json??????????????????????????????
        return jsonObject.toJSONString();
    }


    @RequestMapping("principal_update")
    public String updateAll(DormitoryFault dormitoryFault) throws Exception {
        dormitoryFaultService.update_fault(dormitoryFault);
        return "redirect:/dormitoryFaultInformation";
    }

    @RequestMapping("/selectprincipal")
    public ModelAndView selectName(String attendant,@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int size){
        ModelAndView modelAndView = new ModelAndView();
        List<DormitoryFault> dormitoryFaults = dormitoryFaultService.select_Attendant(attendant, page, size);
        PageInfo pageInfo = new PageInfo(dormitoryFaults);
        modelAndView.addObject("dormitoryFaults", pageInfo);
        modelAndView.setViewName("dormitoryfault");
        return modelAndView;
    }*/


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


}
