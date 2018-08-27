package kh.mark.jarvis.friend.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.friend.model.dao.FriendDao;
import kh.mark.jarvis.friend.model.vo.Friend;
@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private FriendDao dao;
	
	@Override
	public List<Friend> selectFriendList(String member_email) {
		
		return dao.selectFriendList(sqlSession,member_email);
	}

}
