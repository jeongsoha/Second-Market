package second.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import second.common.common.CommandMap;
 
@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketChat {
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    @RequestMapping(value="/chat")
    public ModelAndView getChatViewPage(CommandMap commandMap) throws Exception {
    	ModelAndView mv = new ModelAndView("chat");
    	
    	return mv;
    
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("★ 왁자지껄 채팅방에 입장했습니다. :) ★");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*입장상태인 모든 사용자에게 메시지가 노출된다.*/
    private void sendAllSessionToMessage(Session self,String message) {
    	long systemTime = System.currentTimeMillis(); 
    	SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd HH:mm:ss", Locale.KOREA); 
    	String dTime = formatter.format(systemTime); 
    	
        try {/*본인을 제외한 세션들에게 향상for문을 활용해 채팅내용전달.*/
            for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText("작성자 ("+message.split(",")[0]+") : "+message.split(",")[1]+" ["+dTime+"]");
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    /*내가 작성한 메시지가 나에게 보여진다. */
    @OnMessage
    public void onMessage(String message,Session session) {
    	long systemTime = System.currentTimeMillis(); 
    	SimpleDateFormat formatter = new SimpleDateFormat("yy-MM-dd HH:mm:ss", Locale.KOREA); 
    	String dTime = formatter.format(systemTime); 
        logger.info("Message From "+message.split(",")[0] + ": "+message.split(",")[1]+" ["+dTime+"]");
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("내 메시지 ("+message.split(",")[0] + ") : "+message.split(",")[1]+" ["+dTime+"]");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
} 