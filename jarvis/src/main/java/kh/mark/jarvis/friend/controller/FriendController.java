package kh.mark.jarvis.friend.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.friend.model.service.FriendService;
import kh.mark.jarvis.friend.model.vo.Friend;

@Controller
public class FriendController{
	private Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
	@RequestMapping("/friend/selectList.do")
	public ModelAndView selectFriendList(ModelAndView mv,String member_email) throws Throwable{
//		userId는 jsp에서 ${memberloggedIn.memberAddr}의 값으로 가져온다
		System.out.println("member_email : "+ member_email);
		List<Friend> list = friendService.selectFriendList(member_email);
		mv.addObject("list",list);
		mv.setViewName("friend/friendList");
		return mv;
		
	}
	
	
	
}
