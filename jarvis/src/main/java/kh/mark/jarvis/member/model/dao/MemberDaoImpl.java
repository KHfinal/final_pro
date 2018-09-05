package kh.mark.jarvis.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override	//로그인
	public Member selectLogin(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("member.selectLogin", memberEmail);
				
	}

	@Override	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertMember",member);

	}

	@Override
	public List<Map<String,String>> memberList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.memberList");
	}
	

	
}
