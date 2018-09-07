package kh.mark.jarvis.friend.model.service;

import java.util.List;
import java.util.Map;

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
	
	/*@Override
	public List<Friend> selectFriendList(String member_email) {
		
		return dao.selectFriendList(sqlSession,member_email);
	}*/

	@Override
	public List<Friend> selectFriendListJson(String email) {
		// TODO Auto-generated method stub
		return dao.selectFriendListJson(sqlSession,email);
	}

	@Override
	public int friendRequest(Map<String, String> fr) {
		// TODO Auto-generated method stub
		return dao.friendRequest(sqlSession,fr);
	}

	@Override
	public List<Map<String, String>> requestList(String email) {
		// TODO Auto-generated method stub
		return dao.requestList(sqlSession, email);
	}

	@Override
	public int friendAgree(Map<String, String> fr) {
		// TODO Auto-generated method stub
		return dao.friendAgree(sqlSession, fr);
	}

	@Override
	public int friendRefuse(Map<String, String> fr) {
		// TODO Auto-generated method stub
		return dao.friendRefuse(sqlSession, fr);
	}

	@Override
	public List<Map<String, String>> friendList(String email) {
		// TODO Auto-generated method stub
		return dao.friendList(sqlSession, email);
	};

	

}
