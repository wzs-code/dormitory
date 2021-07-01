package controller;


import com.relam.RsaUtil;
import com.utils.RandomValidateCode;
import com.utils.Sendmail;
import model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;


@Controller
public class LoginController {

    private static final String privateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCFCksS+xkCAaDAhtYAkndKngHqxi82Fpgl01Fis2YL7gXNs9egZhpTi8v+9Zsz0136/ndBpwwmGQb8jgP7hrdB9JGN3KI2ZgUbyQqC6ZXO9e11XzhQwbvTe/ZV5VaXsy2E3WNgzBaknj12nsgziv+UuxySYsnP4ffFZ5oUUX+xfqae5QZE1t79OsX2nH62p4N+SVVs6XMogZaAGjr69PHy10x1GhVSpYt4RXD8V05h/HIpDS3/rJJIoFjqwxlC/wzPa3I11tZDQO7V3laYsDPcqFUnzrmwNF40Hs9+jL1PUw7zAoI7fEDZN7X22v9yr319hqM13jHKsSGGYM3GmEr/AgMBAAECggEAeYBuEfaq3y83bb13AmzBb68glxbKlT5LU/hLUrX+05RdToEZw46cKoL5Gm+af9lg8lKl/ZqfOMgQnmTg9D0TbrP6nrHKn53KupZ/+BF2VN47ML92wiI89Kc40TezPrZQMxCxqvyZDVzLS2M1+gTO6Dl+nZ6FK0r3Kx00Faxcz29DNw3oB5m0qFKlN4pTWE2W8Ds53gmP94KBJ5stRGWX6W4gSGW/RdcUkyE+Psr1WCYbu8mpZ36Y/ahNxGTuv4u3VkUJ+HPlWfwrFNaKiBzJp+4pLq/c+V/YHOWPOOsJRAv/l3nII2lpNSKIhvX8hBEy1+B14b9EjsijXUKEMOsokQKBgQDYl7WILcEEWMoieE9EPqfippWAwZ2VZsmx1n0zOy+vqmJKiBqOglwRCFZf7SNhaF1HR9CmHokmZ97X4hGznM9daIRQFqEr+hc6fq2yawOFPZWhNMiBleaQePBQcjQ50PctZmTC8Rw44qiKGGo6xoMSC+7bBNpf03WcUCRoI1hedwKBgQCdPvEeWkfMFTOM1ibkkFk/DPpWzNcVQbOLd2tv82Raxhxi5AUx+4O+eigx4uY3yUMs1tZGt2owYKMSATwiXQPhD0eXJ8TOErvn0xZzZig7lIfafK8cvI7na7sTthICJegKVqDjZ+o+kkYt1ZN4ka6dzFktrtbf552lYF3HOSLxuQKBgQDFG2L3l/PUudzR+7zfNUnhaIobj5eSE+WvcqujiNQ/wAYNH8lTMW0JjxXT3GHbTne8260U0CsuCU7yFejYFPddYTUwETgBZmnnMMtv2BVvFvlpqDhkPX+CsJy6CQRgLTwUU9+UzIlLd3G7orZh4K/9J2DqboMwu6aHZyOKpcfQxwKBgBrGN9oaNzVpusBVSoQKjBevRwT2lfzZlg++Qr3qLIFEUFsKRlQvZkxNkoCECP0guN5uqkeaPWuFWN7c9PdI7TsqFd+H9vu7tuEPUThPAbS7YrJyHoL/HDoNXupJSyGwgKUaAQUXkYwb7fUp85VJAPl/bQPZTF8NmgspsG4WrXuJAoGAW5U/c2zTDejOf0IjLhbb4fPqisAoA9vs4R4Yx9QyLtC6YX1+DO6ibROv1F9VZLJaYB3KovznmzTYT1Pgx9GaieYoyAScSt6OZRzdnHfljJit5fzPv+px94b/odktc2Teqvhbj/B11PpQw8WUms5I5gJ0v53HrWM1Qz4/UDw7vDU=";

    @Autowired
    private UserService userService;


    @RequestMapping("sign")
    public String sign() {
        return "login";
    }

    @RequestMapping("login")
    public String login(String username, String password, String code, User loginDto, String role, HttpServletRequest request) throws Exception {
        if (StringUtils.isBlank(loginDto.getUsername()) || StringUtils.isBlank(loginDto.getPassword())) {
            Logger.getLogger("用户名或密码不能为空");
            return "redirect:/sign";
        }
        String decodePassword = null;
        decodePassword = RsaUtil.decryptByPrivateKey(password, privateKey);
        UsernamePasswordToken token = new UsernamePasswordToken(username, decodePassword);
        Subject subject = SecurityUtils.getSubject();
        try {
            User user = userService.findUserByUsername(username);
            subject.login(token);
            loginDto.setPassword(null);  //设空防止泄露给其他用户
            String name = request.getParameter("username");
            HttpSession session = request.getSession(true);
            session.setAttribute("name", name);
            session.setAttribute("photo", user.getPhoto());
            System.out.println(user.getPhoto());
            System.out.println(user.getPhoto());
            System.out.println(user.getPhoto());
            System.out.println(user.getPhoto());

            /*聊天需要当前用户信息*/
            session.setAttribute("user", loginDto);
            if (code.equalsIgnoreCase((String) session.getAttribute("ss")) && role.equals(user.getRole()) && role.equals("管理员")) {
                session.setAttribute("admin", role);
                return "redirect:/dorm";
            } else if (code.equalsIgnoreCase((String) session.getAttribute("ss")) && role.equals(user.getRole()) && role.equals("负责人")) {
                session.setAttribute("manager", role);
                return "redirect:/dorm";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return "redirect:/sign";
    }

    @RequestMapping(value = "/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("updatePw")
    public String updatePw(String username, String password, String password1, String password2) {
        System.out.println(username + "  " + password + " " + password1 + "   " + password2);
        userService.update(username, password, password1, password2);
        return "login";
    }


    @RequestMapping("/user_insert")
    public ModelAndView insertStu(@Valid User user, BindingResult result, Model model) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath = "D:\\File\\";
        //定义 文件名
        String filename = null;
        if (!user.getFile().isEmpty()) {//生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().substring(0, 5).replaceAll("-", "");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType = user.getFile().getContentType();
            //获得文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
            //得到 文件名
            filename = uuid + "." + suffixName;
            System.out.println(filename);
            //文件保存路径
            user.getFile().transferTo(new File(localPath + filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = filename;
        System.out.println(sqlPath);
        user.setPhoto(sqlPath);
        user.setRole("负责人");
        userService.insert(user);
        modelAndView.setViewName("login");
        model.addAttribute("user", user);
        return modelAndView;


    }


    @RequestMapping(value = "forgetpwd")
    @ResponseBody
    public Map forgetPass(HttpServletRequest request, @RequestParam("yhmoryx") String yhmoryx, Model model) {
        User xtYh = userService.findUserByUsername(yhmoryx);
        Map<String, String> map = new HashMap<String, String>();
        String msg = "";
        if (yhmoryx.equals("")) {              //用户名不存在
            msg = "请输入用户名或邮箱！";
            map.put("msg", msg);
            return map;
        }
        if (xtYh == null) {              //用户不存在
            msg = "用户名不存在,你不会忘记用户名了吧?";
            map.put("msg", msg);
            return map;
        }
        try {
            String secretKey = UUID.randomUUID().toString();  //密钥
            Timestamp outDate = new Timestamp(System.currentTimeMillis() + 30 * 60 * 1000);//30分钟后过期
            long date = outDate.getTime() / 1000 * 1000;                  //忽略毫秒数
            xtYh.setValidatacode(secretKey);
            xtYh.setOutdate(outDate);
            userService.updateuser(xtYh); //保存到数据库
            String key = xtYh.getUsername() + "$" + date + "$" + secretKey;
            String digitalSignature = DigestUtils.md5Hex(key);                 //数字签名

            String emailTitle = "密码找回";
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
            String resetPassHref = basePath + "resetpassword?sid=" + digitalSignature + "&yhm=" + xtYh.getUsername();
            String emailContent = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href=" + resetPassHref + " target='_BLANK'>点击我重新设置密码</a>" +
                    "<br/>tips:本邮件超过30分钟,链接将会失效，需要重新申请'找回密码'" + "<br/>tips:本链接可能被邮箱拦截，如链接无效，请复制下列链接到您的浏览器中。<br/>" +
                    "链接开始：<span style='color:#F00; font-weight:bold'>" + resetPassHref + "<span>链接结束";
            //
            Sendmail sendmail = new Sendmail();
            sendmail.doSendHtmlEmail(emailTitle, emailContent, xtYh.getEmail());//调用工具类里面的发送发放
            msg = "操作成功,已经发送找回密码链接到您邮箱。请在30分钟内重置密码";
        } catch (Exception e) {
            e.printStackTrace();
            msg = "邮箱不存在？";
        }
        map.put("msg", msg);
        return map;
    }

    @RequestMapping(value = "resetpassword", method = RequestMethod.GET)
    public String checkResetLink(@RequestParam("sid") String sid, @RequestParam("yhm") String yhm, Model model) {
        String msg = "";
        if (sid.equals("") || yhm.equals("")) {
            msg = "链接不完整,请重新生成";
            model.addAttribute("msg", msg);
            return "findPwdError";
        }

        User xtYh = userService.findUserByUsername(yhm);
        if (xtYh == null) {
            msg = "链接错误,无法找到匹配用户,请重新申请找回密码.";
            model.addAttribute("msg", msg);
            return "findPwdError";
        }
        Date outDate = xtYh.getOutdate();
        if(outDate.getTime() <= System.currentTimeMillis()){         //表示已经过期
            msg = "链接已经过期,请重新申请找回密码.";
            model.addAttribute("msg",msg) ;
            return "findPwdError";
        }
        String key = xtYh.getUsername()+"$"+outDate.getTime()/1000*1000+"$"+xtYh.getValidatacode();          //数字签名
        String digitalSignature = DigestUtils.md5Hex(key);
        System.out.println(key+"\t"+digitalSignature);
        if(digitalSignature.equals(sid)) {
            msg = "链接不正确,是否已经过期了?重新申请吧";
            model.addAttribute("msg",msg);
            return "findPwdError";
        }

        model.addAttribute("userName",yhm);
        return "resetpage";

    }

    @RequestMapping("updatepassword")
    public String updatePw(String username, String password) {
        userService.updatepassword(username, password);
        return "login";
    }
}