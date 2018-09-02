package kh.mark.jarvis.group.model.service;

import java.util.List;
import java.util.Map;

import kh.mark.jarvis.group.model.vo.Group;

public interface GroupService {

	int groupInsert(Group g);
	List<Map<String, String>> selectGroupList();
	List<Map<String, String>> groupSearch(String titleSearch);
	List<Map<String, String>> groupFilter(String category);
}
