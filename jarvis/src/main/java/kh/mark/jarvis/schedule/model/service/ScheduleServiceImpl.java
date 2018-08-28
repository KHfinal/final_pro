package kh.mark.jarvis.schedule.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.schedule.model.dao.ScheduleDao;
import kh.mark.jarvis.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ScheduleServiceImpl.class);
	
	
	@Override
	public int addSchedule(Schedule s) {
		logger.debug("스케줄 등록 서비스단 시작");
		return dao.addSchedule(sqlSession,s);
	}


	@Override
	public List loadEventList(String userEmail) {
		return dao.loadEventList(sqlSession,userEmail);
	}

}
