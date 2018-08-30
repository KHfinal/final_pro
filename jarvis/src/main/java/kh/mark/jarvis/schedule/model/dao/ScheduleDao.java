package kh.mark.jarvis.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.schedule.model.vo.Schedule;

public interface ScheduleDao {

	int addSchedule(SqlSessionTemplate sqlSession, Schedule s);

}
