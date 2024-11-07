package com.project.trinity.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("detail")
	public String movePage(String page) {
		switch(page) {
		case "publicData":
			return "apiSample";
		case "summernote":
			return "community/summernote";
			
		}
		return "redirect:/";
	}
	
}
