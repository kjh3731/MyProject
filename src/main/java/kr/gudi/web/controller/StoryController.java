package kr.gudi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoryController {
	
	@RequestMapping("/story")
	public String story() {
		
		return "story";
	}
	
	@RequestMapping("/story/write")
	public String sWrite() {
		
		return "sWrite";
	}
	
	@RequestMapping("/story/write/insert")
	public String a() {
		
		return "redirect:/story";
	}
}
