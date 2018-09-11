package kh.mark.jarvis.group.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.group.model.vo.Group;
import kh.mark.jarvis.group.model.vo.GroupAttachment;
import kh.mark.jarvis.group.model.vo.GroupPost;

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

	@Override
	public List<Map<String, String>> groupSearch(SqlSessionTemplate Session, String titleSearch) {
		
		return Session.selectList("group.groupSearch", titleSearch);
	}

	@Override
	public List<Map<String, String>> groupFilter(SqlSessionTemplate Session, String category) {
		
		return Session.selectList("group.groupFilter", category);
	}

	@Override
	public List<GroupPost> groupView(SqlSessionTemplate Session, int groupNo) {
		
		return Session.selectList("group.groupView", groupNo);
	}
	

	@Override
	public List<GroupAttachment> selectAttachList(SqlSessionTemplate Session, int groupNo) {
		
		return Session.selectList("group.selectAttachList", groupNo);
	}

	@Override
	public int categoryInsert(SqlSessionTemplate Session, Map cat) {
		
		return Session.insert("group.categoryInsert", cat);
	}

	@Override
	public List<Map<String, String>> selectCategory(SqlSessionTemplate Session) {
		
		return Session.selectList("group.selectCategory");
	}

	@Override
	public int insertGroupPost(SqlSessionTemplate Session, GroupPost post) {
		
		return Session.insert("group.insertGroupPost", post);
	}

	@Override
	public int insertAttach(SqlSessionTemplate Session, GroupAttachment a) {
		
		return Session.insert("group.insertAttach", a);
	}
	
	

	
	
	

	
}
