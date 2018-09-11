package kh.mark.jarvis.friend.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.friend.model.vo.Friend;
@Repository
public class FriendDaoImpl implements FriendDao{
	
	/*@Override
	public List<Friend> selectFriendList(SqlSessionTemplate sqlSession, String member_email) {
		return sqlSession.selectList("friend.selectList",member_email);
	}*/

	@Override
	public List<Friend> selectFriendListJson(SqlSessionTemplate sqlSession, String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("friend.selectFriendListJson",email);
	}

	@Override
	public int friendRequest(SqlSessionTemplate sqlSession, Map<String, String> fr) {
		System.out.println("asdasd---------------------------"+fr);
		return sqlSession.insert("friend.friendRequest",fr);
	}

	@Override
	public List<String> requestList(SqlSessionTemplate sqlSession, Map<String,String> map) {
		List<String> list=sqlSession.selectList("friend.requestList",map);
		System.out.println("dao"+list);
		return list;
	}

	@Override
	public int friendAgree(SqlSessionTemplate sqlSession, Map<String, String> fr) {
		return sqlSession.update("friend.friendAgree",fr);
	}

	@Override
	public int friendRefuse(SqlSessionTemplate sqlSession, Map<String, String> fr) {
		return sqlSession.delete("friend.friendRefuse",fr);
	}

	@Override
	public List<String> friendList(SqlSessionTemplate sqlSession, Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("friend.friendList", map);
	}

	@Override
	public String friendOne(SqlSessionTemplate sqlSession, String fEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("friend.friendOne",fEmail);
	}
	
	

}
