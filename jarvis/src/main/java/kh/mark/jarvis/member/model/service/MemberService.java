package kh.mark.jarvis.member.model.service;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberService {
	Member selectLogin(String memberEmail); //로그인

	int insertMember(Member member);	//회원가입

}
