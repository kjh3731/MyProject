package kr.gudi.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MettingController {
	@RequestMapping("/metting")
	public String metting() {
		
		return "metting";
	}
	
	@RequestMapping("/metting/write")
	public String mWrite() {
		
		return "mWrite";
	}
}
