package kh.mark.jarvis.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.member.model.vo.Member;

public interface MemberDao {
	Member selectLogin(SqlSessionTemplate sqlSession, String member_email);

}
