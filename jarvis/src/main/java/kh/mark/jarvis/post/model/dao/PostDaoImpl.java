package kh.mark.jarvis.post.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.JarvisComment;
import kh.mark.jarvis.post.model.vo.JarvisLike;
import kh.mark.jarvis.post.model.vo.Post;

@Repository
public class PostDaoImpl implements PostDao {

	/* post 등록 */
	@Override
	public int insertPost(SqlSessionTemplate sqlSession, Post post) {
		return sqlSession.insert("post.insertPost", post);
	}

	@Override
	public int insertAttach(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("post.insertAttach", a);
	}

	/* post 조회 */
	@Override
	public List<Post> selectPostList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectPostList");
	}

	@Override
	public List<Attachment> selectAttachList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectAttachList");
	}
	
	/* comment 등록 */
	@Override
	public int insertComment(SqlSessionTemplate sqlSession, JarvisComment comment) {
		return sqlSession.insert("post.insertComment", comment);
	}

	/* comment 조회 */
	@Override
	public List<JarvisComment> selectCommentList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectCommentList");
	}

	/* Like 등록 */
	@Override
	public int insertPostLike(SqlSessionTemplate sqlSession, JarvisLike like) {
		return sqlSession.insert("post.insertPostLike", like);
	}
	
	@Override
	public int insertCommentLike(SqlSessionTemplate sqlSession, JarvisLike like) {
		return sqlSession.insert("post.insertCommentLike", like);
	}

	/* Like 조회 */
	@Override
	public List<JarvisLike> selectLikeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("post.selectLikeList");
	}

}