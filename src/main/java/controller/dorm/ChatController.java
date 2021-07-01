package controller.dorm;

import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import model.ParticipantRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller

public class ChatController {


    @Autowired
    public SimpMessagingTemplate messagingTemplate; //消息模板

    @Autowired
    private ParticipantRepository participantRepository; //在线用户存储

    private static final String SUBSCRIBE_LOGIN_URI = "/topic/login"; //订阅的登录地址

    @RequestMapping(value = "chat")
    public ModelAndView loginIntoChatRoom(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        messagingTemplate.convertAndSend(SUBSCRIBE_LOGIN_URI, user);
        participantRepository.add(user.getUsername(),user);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("chatroom");
        return mv;

    }


    /**
     * 返回当前在线人数
     * @return
     */
    @SubscribeMapping("/chat/participants")
    public Long getActiveUserNumber(){
        return Long.valueOf(participantRepository.getActiveSessions().values().size());
    }
}
