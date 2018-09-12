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

	List<JarvisLike> selectPostLike(JarvisLike like);
	
	List<JarvisLike> selectCommentLike(JarvisLike like);

	int selectPostLikeCount(JarvisLike like);
	
	int selectCommentLikeCount(JarvisLike like);

	int deletePostLike(JarvisLike like);

	int deleteCommentLike(JarvisLike like);

	List<JarvisLike> startSelectLike();

	int startSelectPostLikeCountList(JarvisLike like);

	List<Integer> startSelectCommentLikeCountList(JarvisLike like);



	





}