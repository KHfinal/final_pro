package kh.mark.jarvis.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.member.model.service.MemberService;
import kh.mark.jarvis.member.model.vo.Member;
@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//암호화
	@Autowired
	BCryptPasswordEncoder BCPE;
	
	private static List<String> sessionList = new ArrayList<>();
	
	
	// 로그인 정보
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public ModelAndView memberLogin(String memberEmail, String memberPw) {
		Member m = memberService.selectLogin(memberEmail);  //1.회원의 메일정보를 가지고 service의 selectOne으로 이동
		//2.member.member.xml에 다녀온후 아래로 진행
		ModelAndView mv = new ModelAndView();
		
		
		String msg="";
		String loc="";
		
		//아래는 값이 들어오는지 확인 하는것
		logger.debug("Member : " + m);
		System.out.println("Membercontroller : "+m);
		
		//아이디 존재확인
		if(m==null)
		{
				logger.debug("실패실패");
				msg="존재하지 않는 아이디 입니다.";
		}
		else
		{		
			//비밀번호확인
			if (BCPE.matches(memberPw, m.getMemberPw()))
			{
				logger.debug("로그인성공");
				msg="로그인 성공";
				mv.addObject("memberLoggedIn", m);
				loc="/post/socialHomeView.do";
				
			} 
			//비밀번호 오류
			else 
			{
				msg="비밀번호가 일치하지 않습니다.";
				loc="/";
			}
				
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg"); //원래 common/header
		return mv;
	}
	
	@RequestMapping("/page/social.do")
	public String socialPage(Model model) {
		
		return "social/socialHome";
	}

	//로그인화면에서 회원가입 페이지로
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() 
	{
			return "member/memberEnroll";
	}
		
	//회원가입 정보를 가지고 데이터베이스에 자료 넣기
	@RequestMapping("memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) 
	{
		
		//2.암호화하기
		String oriPw=member.getMemberPw(); //암호화 전
		String enPw=BCPE.encode(oriPw);	   //암호화 후
		System.out.println(enPw);	
		member.setMemberPw(enPw);	//암호화 처리한것을 pw에 저장
				
		int result=memberService.insertMember(member); //회원가입 서비스로 이동
		
		String msg="";
		String loc="/";
		
		if (result>0) 
		{
			msg="회원가입을 성공하였습니다.";
		} 
		else 
		{
			msg="회원가입에 실패하였습니다.";
			loc="/views/member/memberEnroll.jsp";
		}
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
		
	
	
}
