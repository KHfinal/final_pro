package kh.mark.jarvis.schedule.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kh.mark.jarvis.member.model.vo.Member;
import kh.mark.jarvis.schedule.model.service.ScheduleService;
import kh.mark.jarvis.schedule.model.vo.Schedule;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		String loc = "/schedule/privateHome.do";
		if(result<=0) {
			msg = "일정등록에 실패하였습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/schedule/privateHome.do")
	public ModelAndView displayPH(ModelAndView mv,HttpSession hs) {
		
		//일정리스트를 arraylist에 담아서 보내야한다. 매개변수로는 사용자의 이메일을 받아야한다.
		Member m = (Member)hs.getAttribute("memberLoggedIn");
		String userEmail = m.getMemberEmail();
		
		List<Map<String, Object>> sList = service.eventList(userEmail);
		JSONArray jsArr = new JSONArray();
		for(Map<String, Object> map : sList) {
			Map<String, String> event = new HashMap<>();
			event.put("title", map.get("TITLE").toString());
			event.put("start", map.get("START_DATE").toString().substring(0, 10));
			event.put("end", map.get("END_DATE").toString().substring(0, 10));
			if(map.get("COLOR") != null) event.put("color", map.get("COLOR").toString());

			jsArr.add(event);
		}
		logger.debug(jsArr.toString());
		
		mv.addObject("events", jsArr);
		mv.setViewName("private/privateHome");
		
		return mv;
	}
	
	@RequestMapping("/schedule/selectOneEvent.do")
	@ResponseBody
	public String loadEvent(Schedule s,ModelAndView mv) throws JsonProcessingException {
		logger.debug(s.toString());
		Schedule event = service.loadEvent(s);
		logger.debug(event.toString());
		Map<String,String> eventMap = new HashMap<>();
		eventMap.put("userEmail", event.getUserEmail());
		eventMap.put("title",event.getTitle());
		eventMap.put("start", event.getStartDate().toString());
		eventMap.put("end", event.getEndDate().toString());
		eventMap.put("content", event.getContent());
		eventMap.put("color",event.getColor());
		String json = new ObjectMapper().writeValueAsString(eventMap);
		logger.debug(json);
		
		return json;
	}
}
