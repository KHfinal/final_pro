package kh.mark.jarvis.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public Member selectLogin(SqlSessionTemplate sqlSession, String member_email) {
		return sqlSession.selectOne("member.selectLogin", member_email);
				
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMember",member);

	}
	

}
