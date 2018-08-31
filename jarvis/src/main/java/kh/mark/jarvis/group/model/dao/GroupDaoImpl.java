package kh.mark.jarvis.group.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.group.model.vo.Group;

@Repository
public class GroupDaoImpl implements GroupDao {

	@Override
	public int groupInsert(SqlSessionTemplate Session, Group g) {
		
		return Session.insert("group.groupInsert", g);
	}

	@Override
	public List<Map<String, String>> selectGroupList(SqlSessionTemplate Session) {
		
		return Session.selectList("group.selectGroupList");
	}
	

	
}
