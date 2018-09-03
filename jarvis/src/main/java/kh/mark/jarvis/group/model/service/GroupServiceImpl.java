package kh.mark.jarvis.group.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.group.model.dao.GroupDao;
import kh.mark.jarvis.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao dao;
	@Autowired
	private SqlSessionTemplate Session;
	
	@Override
	public int groupInsert(Group g) {
		
		return dao.groupInsert(Session, g);
	}

	@Override
	public List<Map<String, String>> selectGroupList() {
		
		return dao.selectGroupList(Session);
	}

	@Override
	public List<Map<String, String>> groupSearch(String titleSearch) {
		
		return dao.groupSearch(Session, titleSearch);
	}

	@Override
	public List<Map<String, String>> groupFilter(String category) {
		
		return dao.groupFilter(Session, category);
	}

	@Override
	public Group groupView(int groupNo) {
		
		return dao.groupView(Session, groupNo);
	}
	
	
	

	
}
