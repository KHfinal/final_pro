package kh.mark.jarvis.group.model.service;

import java.util.List;
import java.util.Map;

import kh.mark.jarvis.group.model.vo.Group;
import kh.mark.jarvis.group.model.vo.GroupAttachment;
import kh.mark.jarvis.group.model.vo.GroupPost;

public interface GroupService {

	int groupInsert(Group g, String[] g_category);
	List<Map<String, String>> selectGroupList();
	List<Map<String, String>> selectCategory();
	List<Map<String, String>> groupSearch(String titleSearch);
	List<Map<String, String>> groupFilter(String category);
	List<GroupPost> groupView(int groupNo);
	int insertGroupPost(GroupPost post, List<GroupAttachment> attList);
	List<GroupAttachment> selectAttachList(int groupNo);
	
}
