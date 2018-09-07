package kh.mark.jarvis.post.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.JarvisComment;
import kh.mark.jarvis.post.model.vo.JarvisLike;
import kh.mark.jarvis.post.model.vo.Post;

public interface PostDao {

	int insertPost(SqlSessionTemplate sqlSession, Post post);

	int insertAttach(SqlSessionTemplate sqlSession, Attachment a);

	List<Post> selectPostList(SqlSessionTemplate sqlSession);

	List<Attachment> selectAttachList(SqlSessionTemplate sqlSession);

	int insertComment(SqlSessionTemplate sqlSession, JarvisComment comment);

	List<JarvisComment> selectCommentList(SqlSessionTemplate sqlSession);

	int insertPostLike(SqlSessionTemplate sqlSession, JarvisLike like);
	
	int insertCommentLike(SqlSessionTemplate sqlSession, JarvisLike like);

	List<JarvisLike> selectLikeList(SqlSessionTemplate sqlSession);

}