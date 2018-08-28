package kh.mark.jarvis.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.friend.controller.FriendController;
import kh.mark.jarvis.member.model.service.MemberService;
import kh.mark.jarvis.member.model.vo.Member;
@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/login")
	public ModelAndView memberLogin(String member_email, String password) {
		ModelAndView mv = new ModelAndView();
		Member m = memberService.selectLogin(member_email);
		String msg="";
		logger.debug("Member : " + m);
		System.out.println("Member : "+m);
		if(m==null)
		{
				logger.debug("실패실패");
				
		}
		else
		{		
				logger.debug("로그인로그인");
				mv.addObject("memberLoggedIn", m);
				
		}
		
		mv.setViewName("common/header");
		return mv;
		
		
		
	}
	
	@RequestMapping("/page/social.do")
	public String socialPage() {
		return "social/socialHome";
	}
}
