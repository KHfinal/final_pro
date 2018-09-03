package kh.mark.jarvis.websocket.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


import kh.mark.jarvis.member.model.vo.Member;



public class SocketHandler extends TextWebSocketHandler {

	
	/*1:1*/
	/*private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();*/

	
	
	
	
	//사용자 연결이 되면 실행되는 메소드
	//채팅방에 입장을 하면 session을 부여하는 곳이라고 보면 됨 
	
	private List<WebSocketSession> sessionList=new ArrayList();
	private Logger logger=LoggerFactory.getLogger(SocketHandler.class);
	List<String> userName = new ArrayList();
	/*List<Member> memberList = new ArrayList();*/
	
//	(2) var sock= new SockJS가 생성되면서 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/*Gson gson = new Gson();*/
		sessionList.add(session);
		
		Member login=(Member)session.getAttributes().get("memberLoggedIn");
		
		
		
		/*memberList.add(login);*/
		

		//json으로 변경
		/*String result = gson.toJson(memberList);
		System.out.println(result);*/
		
		for(WebSocketSession s : sessionList) {
			/*s.sendMessage(new TextMessage(result));*/
			s.sendMessage(new TextMessage("1"+"|"+login.getMemberName()));
		}
		
		
		
		
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		
		
		
		Member login=(Member)session.getAttributes().get("memberLoggedIn");
		logger.debug("closed : " + login.getMemberName());
		logger.debug("현재 접속자 : " + sessionList);
		for(WebSocketSession s : sessionList) {
			
			s.sendMessage(new TextMessage("2"+"|"+login.getMemberName()));
		}
		
		
	}

	
	
	
}
