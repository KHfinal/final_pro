package kh.mark.jarvis.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.schedule.model.service.ScheduleService;
import kh.mark.jarvis.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService service;
	
	private Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@RequestMapping("/schedule/insertSchedule.do")
	public ModelAndView addSchedule(ModelAndView mv,Schedule s) {
		logger.debug("스케줄 컨트롤러 일정등록 시작");
		logger.debug(s.toString());
		int result = service.addSchedule(s);
		String msg = "일정등록에 성공하였습니다.";
		String loc = "/schedule/privateHome.do?userEmail=kkh";
		if(result<=0) {
			msg = "일정등록에 실패하였습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/schedule/privateHome.do")
	public ModelAndView displayPH(ModelAndView mv,String userEmail) {
		List<Schedule> list = new ArrayList<Schedule>();
		list = service.loadEventList(userEmail);
		logger.debug(list.toString());
		List events = new ArrayList<>();
		Map<String, String> result = new HashMap<>();
		for(int i=0;i<list.size();i++) {
			result.put("title", list.get(i).getTitle());
			result.put("start", list.get(i).getStartDate().toString());
			result.put("end",list.get(i).getEndDate().toString());
			events.add(result);
		}
		logger.debug(events.toString());
		mv.setViewName("private/privateHome");
		
		return mv;
	}
}
