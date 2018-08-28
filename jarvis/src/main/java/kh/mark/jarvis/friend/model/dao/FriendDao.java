package kh.mark.jarvis.friend.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.friend.model.vo.Friend;

public interface FriendDao {
	List<Friend> selectFriendList(SqlSessionTemplate sqlSession,String member_email);

}
