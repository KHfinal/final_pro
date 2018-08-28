package kh.mark.jarvis.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {
	
	@RequestMapping("/group/groupList.do")
	public String groupList() {
		return "group/groupList";
	}

}
