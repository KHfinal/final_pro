package kh.mark.jarvis.friend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.friend.model.service.FriendService;
import kh.mark.jarvis.friend.model.vo.Friend;
import kh.mark.jarvis.member.model.service.MemberService;
import kh.mark.jarvis.member.model.vo.Member;

@Controller
public class FriendController{
	private Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MemberService memberService;
	/*@RequestMapping("/friend/selectList.do")*/
	/*public ModelAndView selectFriendList(ModelAndView mv,String member_email) throws Throwable{
//		userId는 jsp에서 ${memberloggedIn.memberAddr}의 값으로 가져온다
		System.out.println("member_email : "+ member_email);
		List<Friend> list = friendService.selectFriendList(member_email);
		mv.addObject("list",list);
		mv.setViewName("friend/friendList");
		return mv;
		
	}*/
	@RequestMapping("/friend/selectFriendListJson.do")
	public ModelAndView selectFriendList(String email,ModelAndView mv){
		
		List<Friend> list = friendService.selectFriendListJson(email);
		
		/*Map map = new HashMap();
		
		mv.addAllObjects(map);*/
		
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		logger.debug("list : "+list);
		return mv;
	}
	@RequestMapping("/friend/selectFriendList.do")
	public String selectFriendList(Model model,HttpServletRequest request) {
		
		String email = request.getParameter("email");
		System.out.println("email : "  + email);
		List<Friend> list = friendService.selectFriendListJson(email);
		model.addAttribute("email",email);
		model.addAttribute("list",list);
		return "friend/friendListView";
	}
	/*@RequestMapping("/friend/selectFriendList.do")
	public String chatting(Model model,HttpServletRequest request) {
		접속한사람 하고 비교?   세션에대한정보가 없기때문에 정확한 구분위해 
		
		
		
		return "friend/friendListView";
	}*/
	
	@RequestMapping("/friend/friendView.do")
	public ModelAndView friendView(HttpSession hs) {
		Member m = (Member)hs.getAttribute("memberLoggedIn");
		String email = m.getMemberEmail();
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>> list=memberService.memberList();
		List<Map<String,String>> requestList=friendService.requestList(email);
		System.out.println("asdfasdfa"+requestList);
		mv.addObject("list",list);
		mv.addObject("requestList",requestList);
		mv.setViewName("friend/friendSearch");
		
		return mv;
	}
	
	@RequestMapping("/friend/friendRequest.do")
	public ModelAndView friendRequest(String myEmail, String fEmail)
	{
		logger.debug("내이메일:"+myEmail);
		logger.debug("친구이메일:"+fEmail);
		ModelAndView mv=new ModelAndView();
		Map<String, String> fr=new HashMap<String, String>();
		fr.put("myEmail", myEmail);
		fr.put("fEmail", fEmail);
		fr.put("p", "P");
		int result=friendService.friendRequest(fr);
		
		String msg="";
	    String loc="/";
	      
	    if (result>0) 
	    {
	       msg="친구요청 메세지를 보냈습니다.";
	       loc="/friend/friendView.do";
	    } 
	    else 
	    {
	       msg="친구요청이 실패했습니다.";
	       loc="/friend/friendView.do";
	    }
	    mv.addObject("msg",msg);
	    mv.addObject("loc",loc);
	    mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/friend/friendAgree.do")
	public ModelAndView friendAgree(HttpSession hs, String fEmail)
	{
		ModelAndView mv=new ModelAndView();
		Member m = (Member)hs.getAttribute("memberLoggedIn");
		String email = m.getMemberEmail();
		Map<String, String> fr=new HashMap<String, String>();
		fr.put("email", email);
		fr.put("fEmail", fEmail);
		fr.put("y", "Y");
		System.out.println("들어가?"+fr);
		int result=friendService.friendAgree(fr);
		System.out.println(result);
		String msg="";
	    String loc="/";
	      
	    if (result>0) 
	    {
	       msg="친구요청이 수락되었습니다.";
	       loc="/friend/friendView.do";
	    } 
	    else 
	    {
	       msg="친구요청이 실패했습니다.";
	       loc="/friend/friendView.do";
	    }
	    mv.addObject("msg",msg);
	    mv.addObject("loc",loc);
	    mv.setViewName("common/msg");
		return mv;
	}
		
	@RequestMapping("/friend/friendRefuse.do")
	public ModelAndView friendRefuse(HttpSession hs, String fEmail)
	{
		ModelAndView mv=new ModelAndView();
		Member m = (Member)hs.getAttribute("memberLoggedIn");
		String email = m.getMemberEmail();
		Map<String, String> fr=new HashMap<String, String>();
		fr.put("email", email);
		fr.put("fEmail", fEmail);
		int result=friendService.friendRefuse(fr);
		String msg="";
	    String loc="/";
	      
	    if (result>0) 
	    {
	       msg="친구요청이 취소되었습니다.";
	       loc="/friend/friendView.do";
	    } 
	    else 
	    {
	       msg="취소를 실패했습니다.";
	       loc="/friend/friendView.do";
	    }
	    mv.addObject("msg",msg);
	    mv.addObject("loc",loc);
	    mv.setViewName("common/msg");
		return mv;
	}
}
