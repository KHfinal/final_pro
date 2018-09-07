package kh.mark.jarvis.post.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.post.model.service.PostService;
import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.JarvisComment;
import kh.mark.jarvis.post.model.vo.JarvisLike;
import kh.mark.jarvis.post.model.vo.Post;

@Controller
public class PostController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService service;
	
	// 1. 게시물 조회
	@RequestMapping("/post/socialHomeView.do")
	public String selectPost(Model model) {
		
		List<Post> postList = service.selectPostList();
		List<Attachment> attachmentList = service.selectAttachList();
		List<JarvisComment> commentList = service.selectCommentList();
		List<JarvisLike> likeList = service.selectLikeList();
			
		if(postList != null && attachmentList != null) {
			model.addAttribute("postList", postList);
			model.addAttribute("attachmentList", attachmentList);
		}
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("likeList", likeList);
		
		String loc = "social/socialHome";
		
		return loc; 
	}
	
	// 2. 게시물 등록
	@RequestMapping("/post/insertPost.do")
	public ModelAndView insertPost(Post post, MultipartFile[] upFile, HttpServletRequest request) throws ParseException {
		logger.debug(post.getPostContents());
		logger.debug(post.getPostWriter());
		logger.debug(post.getPrivacyBound());

		for(int i=0; i<upFile.length; i++) {
			logger.debug(upFile[i].getOriginalFilename());
		}
		
		// postDate를 미리 지정해줘야한다.
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/post");
		List<Attachment> attList = new ArrayList<Attachment>();
		
		File dir = new File(saveDir);
		if(dir.exists() == false) dir.mkdirs();
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd_HHmmssSS");
				
				int rndNum = (int) (Math.random() * 1000);
				String renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
				renamedFileName += "_" + rndNum + "." + ext; 
				
				try {
					f.transferTo(new File(saveDir + "/" + renamedFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				Attachment attach = new Attachment();
				attach.setOriginalFileName(originalFileName);
				attach.setRenamedFileName(renamedFileName);
				attList.add(attach);
				
			}
		}
		
		int result = service.insertPost(post, attList);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg = "POST를 성공적으로 등록하였습니다.";
			loc = "/post/socialHomeView.do";
		} else {
			msg = "POST 등록이 실패하였습니다.";
			loc = "/social/socialHome";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	// 3. 댓글 등록
	@RequestMapping(value="/post/postCommentInsert.do", method=RequestMethod.POST)
	public ModelAndView insertComment(JarvisComment comment) {
		ModelAndView mv = new ModelAndView();
		
		int result = service.insertComment(comment);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "댓글이 성공적으로 등록되었습니다.";
			loc = "/post/socialHomeView.do";
		} else {
			msg = "댓글 등록이 실패하였습니다.";
			loc = "/social/socialHome";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	// 좋아요 등록
	@RequestMapping(value="/post/likeInsert.do", method=RequestMethod.POST)
	public ModelAndView insertLike(JarvisLike like) {
		ModelAndView mv = new ModelAndView();
		
		logger.debug("likeInsert.do 입장");
		logger.debug(like.getLikeMember());
		
		
		if(like.getPostRef() != 0) {
			int result = service.insertPostLike(like);
		}
		
		if(like.getCommentRef() != 0) {
			int result = service.insertCommentLike(like);
		}
		
		mv.addObject("msg", "좋아요!");
		mv.addObject("loc", "/post/socialHomeView.do");
		
		mv.setViewName("common/msg");
	
		return mv;
	}
}