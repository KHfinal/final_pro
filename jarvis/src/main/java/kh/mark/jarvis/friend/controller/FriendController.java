package kh.mark.jarvis.friend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.friend.model.service.FriendService;
import kh.mark.jarvis.friend.model.vo.Friend;

@Controller
public class FriendController{
	private Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
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
	@RequestMapping("/chatting.do")
	public String chatting(Model model,HttpServletRequest request) {
		/*접속한사람 하고 비교? */ /* 세션에대한정보가 없기때문에 정확한 구분위해 */
		String email = request.getParameter("email");
		List<Friend> list = friendService.selectFriendListJson(email);
		model.addAttribute("email",email);
		model.addAttribute("list",list);
		return "friend/chattingView";
	}
	
	
	
	
	
}
