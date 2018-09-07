package kh.mark.jarvis.post.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.post.model.dao.PostDao;
import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.JarvisComment;
import kh.mark.jarvis.post.model.vo.JarvisLike;
import kh.mark.jarvis.post.model.vo.Post;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertPost(Post post, List<Attachment> attList) {
		int result = 0;
		int postNo = 0;
		
		result = dao.insertPost(sqlSession, post);
		postNo = post.getPostNo();
		
		if(attList.size() > 0) {
			for(Attachment a : attList) {
				a.setPostNo(postNo);
				result = dao.insertAttach(sqlSession, a);
			}
		}
		return result;
	}
	
	@Override
	public List<Post> selectPostList() {
		return dao.selectPostList(sqlSession);
	}

	@Override
	public List<Attachment> selectAttachList() {
		return dao.selectAttachList(sqlSession);
	}

	@Override
	public int insertComment(JarvisComment comment) {
		int result = dao.insertComment(sqlSession, comment);
		return result;
	}

	@Override
	public List<JarvisComment> selectCommentList() {
		return dao.selectCommentList(sqlSession);
	}

	@Override
	public int insertPostLike(JarvisLike like) {
		int result = dao.insertPostLike(sqlSession, like);
		return result;
	}
	
	@Override
	public int insertCommentLike(JarvisLike like) {
		int result = dao.insertCommentLike(sqlSession, like);
		return result;
	}

	@Override
	public List<JarvisLike> selectLikeList() {
		return dao.selectLikeList(sqlSession);
	}
}
