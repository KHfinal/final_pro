package kh.mark.jarvis.post.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.mark.jarvis.post.model.service.PostService;

@Controller
public class PostController {

	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private PostService service;
}
