package kh.mark.jarvis.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminMenuView";
	}
}
