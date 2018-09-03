package kh.mark.jarvis.chatting.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {

	@RequestMapping("/chat/chattingView.do")
	public String chatting(Model model, HttpServletRequest request)
	{
		model.addAttribute("host",request.getRemoteAddr());
		
		return "chat/chattingView";
	}
}
