package kh.mark.jarvis.chatting.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.mark.jarvis.friend.model.service.FriendService;

@Controller
public class ChattingController {

	@Autowired
	private FriendService friendService;
	
	@RequestMapping("/chat/chattingView.do")
	public String chatting(Model model, HttpServletRequest request, String fEmail)
	{
		/*String friendEmail=friendService.friendOne(fEmail);
		String msg="";
		String loc="/";
		if(fEmail==friendEmail)
		{*/
			model.addAttribute("host",request.getRemoteAddr());
		/*}*/

		
		return "chat/chattingView";
	}
}
