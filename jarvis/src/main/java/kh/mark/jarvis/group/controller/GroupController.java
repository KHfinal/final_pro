package kh.mark.jarvis.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.group.model.service.GroupService;
import kh.mark.jarvis.group.model.vo.Group;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService service;
	
	@RequestMapping("/group/groupList.do")
	public String groupList() {
		return "group/groupList";
	}
	
	@RequestMapping("/group/groupInsert.do")
	public String groupInsert(String g_name, String g_intro, String[] g_category) {
		Group g=new Group();
		g.setG_name(g_name);
		g.setG_intro(g_intro);
		g.setG_category(g_category);
		
		int result=service.groupInsert(g);
		
		return "common/msg";
	}

}
