package kh.mark.jarvis.friend.model.service;

import java.util.List;
import java.util.Map;

import kh.mark.jarvis.friend.model.vo.Friend;

public interface FriendService {
	/*List<Friend> selectFriendList(String member_email);*/
	List<Friend> selectFriendListJson(String email);
	int friendRequest(Map<String, String> fr);
	List<Map<String,String>> requestList(String email);
	int friendAgree(Map<String, String> fr);
	int friendRefuse(Map<String, String> fr);
}
