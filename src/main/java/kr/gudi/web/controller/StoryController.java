package kr.gudi.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoryController {
	
	@RequestMapping("/story")
	public String story() {
		
		return "story";
	}
}
