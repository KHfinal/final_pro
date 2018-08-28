package kh.mark.jarvis.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.schedule.model.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	private Logger logger = LoggerFactory.getLogger(ScheduleDaoImpl.class);
	
	@Override
	public int addSchedule(SqlSessionTemplate sqlSession, Schedule s) {
		logger.debug("스케줄등록 dao단 시작");
		return sqlSession.insert("schedule.addSchedule",s);
	}

}
