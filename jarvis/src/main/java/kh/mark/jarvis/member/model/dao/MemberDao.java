package kh.mark.jarvis.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberDao {
	
	Member selectLogin(SqlSessionTemplate sqlSession, String memberEmail); //로그인
	
	
	int insertMember(SqlSessionTemplate sqlSession, Member member);  //회원추가

}
