package kh.mark.jarvis.schedule.model.service;

import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.schedule.model.vo.Schedule;

public interface ScheduleService {

	int addSchedule(Schedule s);
	
}
