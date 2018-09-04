package kh.mark.jarvis.group.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.group.model.service.GroupService;
import kh.mark.jarvis.group.model.vo.Group;

@Controller
public class GroupController {
	
	private Logger logger=LoggerFactory.getLogger(GroupController.class);
	@Autowired
	private GroupService service;
	
	@RequestMapping("/group/groupList.do")
	public ModelAndView selectGroupList() {
		ModelAndView mv=new ModelAndView();
		List<Map<String, String>> list=service.selectGroupList();
		
		logger.debug("list"+list);
		mv.addObject("list", list);
		mv.setViewName("group/groupList");
		return mv;
	}
	
	@RequestMapping("/group/groupInsert.do")
	public ModelAndView groupInsert(Group g, String[] g_category, MultipartFile upFile, HttpServletRequest request) {
		
		System.out.println(g.getG_name());
		System.out.println(g.getG_intro());
		
		logger.debug("寃뚯떆???낅줈??: "+upFile);
		/*?곸꽭??multipartFile?뚯븘蹂닿린*/
		logger.debug("param.group : "+g);
		logger.debug("파일 이름 : "+upFile.getName());
		logger.debug("기존 파일 이름: "+upFile.getOriginalFilename());
		logger.debug("파일 크기: "+upFile.getSize());
		System.out.println(g_category[0]);
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/group");
		
		File dir=new File(saveDir);
		if(dir.exists()==false) dir.mkdirs();
		
			if(!upFile.isEmpty()) {
				String originalFilename=upFile.getOriginalFilename();
				String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
				int rndNum=(int)(Math.random()*1000);
				String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
				renamedFileName+="_"+rndNum+"."+ext;
				try {
					/*?쒕쾭???대떦寃쎈줈???뚯씪????ν븯??紐낅졊*/
					upFile.transferTo(new File(saveDir+"/"+renamedFileName));
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				g.setG_originalFilename(originalFilename);
				g.setG_renamedFilename(renamedFileName);
			}
		
		
		
		int result=service.groupInsert(g, g_category);
		
		ModelAndView mv=new ModelAndView();
		String msg="";
		String loc="/group/groupList.do";
		if(result>0) {
			msg="그룹이 생성되었습니다.";
		}
		else {
			msg="그룹 생성에 실패하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/group/groupSearch.do")
	public ModelAndView groupSearch(String titleSearch) {
		ModelAndView mv=new ModelAndView();
		logger.debug(titleSearch);
		List<Map<String, String>> list=service.groupSearch(titleSearch);
		
		mv.addObject("list", list);
		mv.setViewName("group/groupList");
		return mv;
	}
	
	@RequestMapping("/group/groupFilter.do")
	public ModelAndView groupFilter(String category) {
		ModelAndView mv=new ModelAndView();
		logger.debug(category);
		List<Map<String, String>> list=service.groupFilter(category);
		
		mv.addObject("list", list);
		mv.setViewName("group/groupList");
		
		return mv;
	}
	
	@RequestMapping("/group/groupView.do")
	public ModelAndView groupView(int groupNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println(groupNo);
		
		Group g=service.groupView(groupNo);
		
		System.out.println(g);
		
		mv.addObject("group", g);
		mv.setViewName("group/groupView");
		
		return mv;
	}

}
