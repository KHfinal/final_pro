package kh.mark.jarvis.post.model.service;

import java.util.List;

import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.Post;

public interface PostService {

	int insertPost(Post post, List<Attachment> attList);

	List<Attachment> selectAttach(int postNo);

	List<Post> selectPostList();


}