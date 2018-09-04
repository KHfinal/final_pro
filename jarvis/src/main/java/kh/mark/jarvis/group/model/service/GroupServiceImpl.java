package kh.mark.jarvis.group.model.service;

import java.util.HashMap;
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
	public int groupInsert(Group g, String[] g_category) {
		
		int result=0;
		int groupNo=0;
		Map cat=new HashMap();
		
		//try {
			result=dao.groupInsert(Session, g);
			groupNo=g.getG_no();
			if(g_category.length>0) {
				for(int i=0;i<g_category.length;i++) {
					cat.put("g_no", groupNo);
					cat.put("g_category", g_category[i]);
					dao.categoryInsert(Session, cat);
				}
			}			
		//}
		/*catch (Exception e) {
			System.out.println(e.getMessage());
			throw new RuntimeException();
		}*/
		return result;
		
		
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
