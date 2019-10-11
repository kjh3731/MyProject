package kr.gudi.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gudi.web.bean.StoryBean;

@Controller
public class StoryController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping("/story")
	public String story(StoryBean sb, Model model) {
		model.addAttribute("list", sql.selectList("write.storySelect", sb));
		return "story";
	}
	
	@RequestMapping("/story/write")
	public String sWrite(HttpSession session) {
		String returnUrl = "";
		if(session.getAttribute("sId") == null) {
			System.out.println("세션없이 글쓰기 시도");
			returnUrl = "redirect:/story";
		} else {
			returnUrl = "sWrite";
		}
		return returnUrl;
	}
	
	@RequestMapping("/story/write/{key}")
	public String sCRUD(@PathVariable("key") String key, StoryBean sb, HttpSession session) {
		System.out.println(sb.toString());
		String sId = session.getAttribute("sId").toString();
		switch (key) {
		case "insert":
			sb.setsId(sId);
			sql.insert("write.storyInsert", sb);
			break;

		default:
			break;
		}
		return "redirect:/story";
	}
	
	@RequestMapping("/story/read/{key}")
	public String sRead(@PathVariable("key") String key, StoryBean sb, Model model) {
		sb.setsNo(key);
		model.addAttribute("read", sql.selectOne("read.storySelect", sb));
		return "sRead";
	}
	
}
