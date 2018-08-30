package kh.mark.jarvis.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.member.model.dao.MemberDao;
import kh.mark.jarvis.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override	//로그인
	public Member selectLogin(String memberEmail) {
		// TODO Auto-generated method stub
		return memberDao.selectLogin(sqlSession,memberEmail);
	}

	@Override	//회원가입
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		System.out.println("서비스 insert : "+member);
		return memberDao.insertMember(sqlSession,member);
	}
	

}
