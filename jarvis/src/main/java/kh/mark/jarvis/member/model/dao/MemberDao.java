package kh.mark.jarvis.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberDao {
	
	Member selectLogin(SqlSessionTemplate sqlSession, String memberEmail); //로그인
	
	
	int insertMember(SqlSessionTemplate sqlSession, Member member);  //회원추가

	
	
	List<Map<String,String>> memberList(SqlSessionTemplate sqlSession);		//회원리스트
}
