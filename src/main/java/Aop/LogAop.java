package Aop;

import controller.LoginController;
import model.SysLog;
import model.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import service.SysLogService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SysLogService sysLogService;


    private Date visitTime;//开始访问的时间
    private Class clazz;//访问的类
    private Method method;//访问的方法



    //前置通知
    @Before("execution(* controller.dorm..*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime=new Date();
        clazz=jp.getTarget().getClass();
        String methodName=jp.getSignature().getName();
        Object[] args = jp.getArgs();
        Class[] parameterTypes = ((MethodSignature)jp.getSignature()).getMethod().getParameterTypes();
        method = clazz.getMethod(methodName,parameterTypes);

    }
    //后置通知
    @After("execution(* controller.dorm..*(..))")
    public void doAfter(JoinPoint pt) throws Exception {

        long time=new Date().getTime()-visitTime.getTime();//获取访问时长
        String url="";
        //获取url
        if(clazz!=null&&method!=null&&clazz!=LogAop.class){
            //1.获取mapping值
            RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
            if(methodAnnotation!=null){
                String[] methodValue=methodAnnotation.value();
//                String username=a.getAdmin();
                HttpSession session = request.getSession();
                //获取访问的ip地址
                String ip=request.getRemoteAddr();
                url=ip+"/"+request.getServerPort()+request.getContextPath()+methodValue[0];
                //封装日志信息
                SysLog sysLog=new SysLog();
                sysLog.setExecutionTime(time);
                sysLog.setIp(ip);
                sysLog.setUrl(url);
                sysLog.setUsername((String) session.getAttribute("name"));
                sysLog.setVisitTime(visitTime);
                sysLog.setMethod("[类名]："+clazz.getName() +" [方法名]："+method.getName() );
                //记录操作
                sysLogService.save(sysLog);
            }

        }

    }
}