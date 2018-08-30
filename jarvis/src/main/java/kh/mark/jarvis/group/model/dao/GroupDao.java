package kh.mark.jarvis.group.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.group.model.vo.Group;

public interface GroupDao {

	int groupInsert(SqlSessionTemplate Session, Group g);
}
