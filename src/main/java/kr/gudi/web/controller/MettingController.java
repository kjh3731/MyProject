package kr.gudi.web.controller;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gudi.web.bean.HomeBean;

@Controller
public class MettingController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping("/metting")
	public String metting(Model model, HomeBean hb) {
		
		model.addAttribute("list", sql.selectList("metting.select", hb));
		return "metting";
	}
	
	@RequestMapping("/metting/search")
	public String search() {
		
		return "redirect:/metting";
	}
	
	@RequestMapping("/metting/write")
	public String mWrite() {
		
		return "mWrite";
	}
	
	@PostMapping("/metting/write/{key}")
	public String crud(@PathVariable("key") String key, HomeBean hb) {
		switch (key) {
		case "insert":
			HashMap<String, Object> test = new HashMap<String, Object>();
			test.get("ad");
			sql.insert("metting.insert", hb);
			break;

		default:
			break;
		}
		
		return "redirect:/metting";
	}
}
