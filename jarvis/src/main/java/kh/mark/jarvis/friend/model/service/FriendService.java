package kh.mark.jarvis.friend.model.service;

import java.util.List;

import kh.mark.jarvis.friend.model.vo.Friend;

public interface FriendService {
	List<Friend> selectFriendList(String member_email);

}
