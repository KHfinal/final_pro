package kh.mark.jarvis.websocket.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kh.mark.jarvis.member.model.vo.Member;


public class SocketHandler extends TextWebSocketHandler {

	/*private List<WebSocketSession> sessionList=new ArrayList();*/
	private Logger logger=LoggerFactory.getLogger(SocketHandler.class);
	/*1:1*/
	 private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

	
	@Override
	
	
	//사용자 연결이 되면 실행되는 메소드
	//채팅방에 입장을 하면 session을 부여하는 곳이라고 보면 됨 
	
	
//	(2) var sock= new SockJS가 생성되면서 실행
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//server접속했을때 부여하는 sessionId값이랑 다름
		//logger.info("접속한 사용자 : "+session);
		
		/*1:1*/
		sessions.put(session.getId(), session);
		
		/*logger.debug("@@@@@@@@@@@@@현재 접속자 : " + sessionList);*/
		
		//server의 session객체에 저장되어있는 값을 불러오기!
		//spring security가 적용되어있어야함! 
		
		/*sessionList.add(session);

			Member login=(Member)session.getAttributes().get("memberLoggedIn");
			//채팅방입장하면 상대방에게 입장메세지를 출력
			for(WebSocketSession s : sessionList )
			{	
//				s에 있는 사람중 현재 접속한 사람을 제외하고 현재 접속한 사람의 아이디를 출력
				
				if(s==session) continue;
				s.sendMessage(new TextMessage(login.getUserId()+"님이 입장하셨습니다.!"));
				
			}*/
			


		
		
		
		
	}

	@Override
	//메세지를 sessionList인원들에게 전송!
	
	
//	(3) sock.send() 실행시 
//	message는 view에서 사용자가 보낸 메세지
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Member login=(Member)session.getAttributes().get("memberLoggedIn");
		
		
		/*for(WebSocketSession s : sessionList)
		{
			//보내는 순서를 정확하게 기억을 해야함 "|"구분자로 
			//배열로 처리한 다음 페이지를 변경
			s.sendMessage(new TextMessage(login.getUserId()+"|"+message.getPayload()+"|"+session.getRemoteAddress()));
			 (4) sendMessage 하게되면 onMessage(evt)로 이동한다
		}*/
		
		/* 1:1*/
		Iterator<String> sessionIds = sessions.keySet().iterator();
       String sessionId = "";
       while (sessionIds.hasNext()) {
           sessionId = sessionIds.next();
           sessions.get(sessionId).sendMessage(new TextMessage(login.getMemberName()+"|"+message.getPayload()+"|"+session.getRemoteAddress()));
           
       }
       
       //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
//       session.sendMessage(new TextMessage("echo:" + message.getPayload()));
		
	}

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		/*1:1*/
		sessions.remove(session.getId());
		
		/*sessionList.remove(session);
		
		Member login=(Member)session.getAttributes().get("memberLoggedIn");
		for(WebSocketSession s : sessionList)
		{
			
			s.sendMessage(new TextMessage(login.getUserId()+"님이 퇴장하셨습니다."));
		}*/
		
		
		//super.afterConnectionClosed(session, status);
	}

	
	
	
}
