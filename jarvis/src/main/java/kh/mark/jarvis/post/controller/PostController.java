package kh.mark.jarvis.post.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.mark.jarvis.post.model.service.PostService;
import kh.mark.jarvis.post.model.vo.Attachment;
import kh.mark.jarvis.post.model.vo.Post;

@Controller
public class PostController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService service;
	
	@RequestMapping("/post/insertPost")
	public ModelAndView insertPost(Post post, MultipartFile[] upFile, HttpServletRequest request) {
		logger.debug(post.getPostContents());
		logger.debug(post.getPostWriter());
		logger.debug(post.getPrivacyBound());
		logger.debug(upFile[0].getOriginalFilename());
		logger.debug(upFile[1].getOriginalFilename());
		logger.debug(upFile[2].getOriginalFilename());
		
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
		
//		int result = service.insertPost(post, attList);
		
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}