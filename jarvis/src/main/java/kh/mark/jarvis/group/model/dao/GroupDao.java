package kh.mark.jarvis.group.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.group.model.vo.Group;

public interface GroupDao {

	int groupInsert(SqlSessionTemplate Session, Group g);
	List<Map<String, String>> selectGroupList(SqlSessionTemplate Session);
	List<Map<String, String>> groupSearch(SqlSessionTemplate Session, String titleSearch);
	List<Map<String, String>> groupFilter(SqlSessionTemplate Session, String category);
	Group groupView(SqlSessionTemplate Session, int groupNo);
}
