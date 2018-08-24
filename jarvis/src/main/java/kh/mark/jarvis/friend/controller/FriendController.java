package kh.mark.jarvis.friend.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.friend.model.service.FriendService;
import kh.mark.jarvis.friend.model.vo.Friend;
import kh.mark.jarvis.member.model.vo.member.Member;

@Controller
public class FriendController{
	private Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService service;
	
	@RequestMapping("friend/selectList.do")
	public ModelAndView selectList(ModelAndView mv,String userId) throws Throwable{
//		userId는 jsp에서 ${memberloggedIn.memberAddr}의 값으로 가져온다
		List<Friend> list = service.selectList(userId);
		mv.addObject("list",list);
		mv.setViewName("friend/friendList");
		return mv;
		
	}
	
}
