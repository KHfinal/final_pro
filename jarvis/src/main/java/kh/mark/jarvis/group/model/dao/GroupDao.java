package kh.mark.jarvis.group.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.group.model.vo.Group;
import kh.mark.jarvis.group.model.vo.GroupAttachment;
import kh.mark.jarvis.group.model.vo.GroupPost;

public interface GroupDao {

	int groupInsert(SqlSessionTemplate Session, Group g);
	List<Map<String, String>> selectGroupList(SqlSessionTemplate Session);
	List<Map<String, String>> selectCategory(SqlSessionTemplate Session);
	List<Map<String, String>> groupSearch(SqlSessionTemplate Session, String titleSearch);
	List<Map<String, String>> groupFilter(SqlSessionTemplate Session, String category);
	List<GroupPost> groupView(SqlSessionTemplate Session, int groupNo);
	int categoryInsert(SqlSessionTemplate Session, Map cat);
	int insertGroupPost(SqlSessionTemplate Session, GroupPost post);
	int insertAttach(SqlSessionTemplate Session, GroupAttachment a);
	List<GroupAttachment> selectAttachList(SqlSessionTemplate Session, int groupNo);
}
