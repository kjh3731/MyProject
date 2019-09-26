package kr.gudi.web.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.gudi.web.bean.HomeBean;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<HomeBean> list = sql.selectList("home.select");
		model.addAttribute("list", list);
		return "home";
	}

	@RequestMapping("/dd")
	public String mWrite() {
		
		return "redirect:/";
	}
}
