package kh.mark.jarvis.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/member/login.do")
	public String memberLogin() {
		return "common/header1";
	}
	
	@RequestMapping("/page/social.do")
	public String socialPage() {
		return "group/groupList";
	}
	
	@RequestMapping("/page/private.do")
	public String privatePage() {
		return "private/privateHome";
	}
}
