package kh.mark.jarvis.post.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.post.model.dao.PostDao;
import kh.mark.jarvis.post.model.vo.Attachment;
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
}
