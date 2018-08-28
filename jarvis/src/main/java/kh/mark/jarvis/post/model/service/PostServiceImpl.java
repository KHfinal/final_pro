package kh.mark.jarvis.post.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mark.jarvis.post.model.dao.PostDao;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
}
