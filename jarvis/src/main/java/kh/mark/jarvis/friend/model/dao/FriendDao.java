package kh.mark.jarvis.friend.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.friend.model.vo.Friend;

public interface FriendDao {
	/*List<Friend> selectFriendList(SqlSessionTemplate sqlSession,String member_email);*/
	List<Friend> selectFriendListJson(SqlSessionTemplate sqlSession,String email);
	int friendRequest(SqlSessionTemplate sqlSession, Map<String, String> fr);
	List<String> requestList(SqlSessionTemplate sqlSession, Map<String,String> map);
	int friendAgree(SqlSessionTemplate sqlSession, Map<String,String> fr);
	int friendRefuse(SqlSessionTemplate sqlSession, Map<String,String> fr);
	List<String> friendList(SqlSessionTemplate sqlSession, Map map);
	String friendOne(SqlSessionTemplate sqlSession, String fEmail);
}
