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
	
	@Override
	public Member selectLogin(String member_email) {
		// TODO Auto-generated method stub
		return memberDao.selectLogin(sqlSession,member_email);
	}
	

}
