package kh.mark.jarvis.member.model.service;

import java.util.List;
import java.util.Map;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberService {
	Member selectLogin(String memberEmail); //로그인

	int insertMember(Member member);	//회원가입
	
	
	
	List<Map<String,String>> memberList();			//회원리스트
}
