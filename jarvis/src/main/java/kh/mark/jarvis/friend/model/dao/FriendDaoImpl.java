package kh.mark.jarvis.friend.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.friend.model.vo.Friend;
@Repository
public class FriendDaoImpl implements FriendDao{
	
	@Override
	public List<Friend> selectList(SqlSessionTemplate sqlSession, String member_email) {
		return sqlSession.selectList("friend.selectList",member_email);
	}

}
