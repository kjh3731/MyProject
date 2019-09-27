package kr.gudi.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gudi.web.bean.HomeBean;

@Controller
public class MettingController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping("/metting")
	public String metting(Model model) {
		List<HomeBean> list = sql.selectList("metting.select");
		model.addAttribute("list", list);
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
			sql.insert("metting.insert", hb);
			break;

		default:
			break;
		}
		
		return "redirect:/metting";
	}
}
