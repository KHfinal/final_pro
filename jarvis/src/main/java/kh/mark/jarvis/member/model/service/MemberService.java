package kh.mark.jarvis.member.model.service;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberService {
	Member selectLogin(String member_email);

}
