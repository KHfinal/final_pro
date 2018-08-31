package kh.mark.jarvis.post.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.Post;

@Repository
public class PostDaoImpl implements PostDao {

	@Override
	public int insertPost(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.insert("post.insertPost", post);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("post.insertAttach", a);
	}

	@Override
	public List<Post> selectPostList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectPostList");
	}
	

	@Override
	public List<Attachment> selectAttach(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectAttach");
	}

}