package kh.mark.jarvis.schedule.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.schedule.model.vo.Schedule;

public interface ScheduleService {

	int addSchedule(Schedule s);

	List<Map<String, Object>> eventList(String userEmail);
	
}
