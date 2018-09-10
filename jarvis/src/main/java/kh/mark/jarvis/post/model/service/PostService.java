package kh.mark.jarvis.post.model.service;

import java.util.List;

import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.JarvisComment;
import kh.mark.jarvis.post.model.vo.JarvisLike;
import kh.mark.jarvis.post.model.vo.Post;

public interface PostService {

	int insertPost(Post post, List<Attachment> attList);

	List<Attachment> selectAttachList();

	List<Post> selectPostList();

	int insertComment(JarvisComment comment);

	List<JarvisComment> selectCommentList();

	int insertPostLike(JarvisLike like);
	
	int insertCommentLike(JarvisLike like);

	List<JarvisLike> selectPostLike(int postRef);

	int selectPostLikeCount(int postRef);

	List<JarvisLike> selectCommentLike(int commentRef);





}