package controller.dorm;


import com.github.pagehelper.PageInfo;
import model.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.NoticeService;

import java.util.List;

@Controller
public class AdminController {


    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/notice")
    public ModelAndView getNotice() throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("notice");
        return mv;
    }

    //ueditor隐藏域默认的键名称为editorValue
    @RequestMapping("/sumbit")
    public String uploading(String editorValue,Notice notice) {
        // editorValue 为接收富文本编辑器提交的内容
        notice.setNotice(editorValue);
        noticeService.insertNotice(notice);
        return "redirect:/shownotices";
    }

    @RequestMapping("/shownotices")
    public ModelAndView shows(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size,Model model) {
        int number;
        number = noticeService.total();
        model.addAttribute("number",number);
        // editorValue 为接收富文本编辑器提交的内容
        ModelAndView mv=new ModelAndView();
        List<Notice> list=noticeService.selectAll(page,size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageinfo", pageInfo);
        mv.setViewName("noticelist");
        return mv;
    }

    @RequestMapping("/shownotice")
    public ModelAndView show(Integer id) {
        ModelAndView mv=new ModelAndView();
        Notice notice = noticeService.select(id);
        mv.addObject("notices", notice);
        mv.setViewName("shownotice");
        return mv;
    }



}