package kr.gudi.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.gudi.web.bean.HomeBean;
import net.sf.json.JSONObject;

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
	
	@RequestMapping("/home")
	public void ajaxHome(HomeBean hb) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", sql.selectList("home.select", hb));
		
	}
	
	@RequestMapping("/dateNav2")
	public String dateNav(HttpServletResponse res, HttpServletRequest req) {
		return "dateNav";
	}

	@RequestMapping("/dateNav")
	public void mWrite(HttpServletResponse res, HttpServletRequest req) {
//		String a = req.getParameter("name");
//		String b = req.getParameter("location");
//		
//		System.out.println(a);
//		System.out.println(b);
		try {
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("result", sql.selectList("metting.select"));
//			res.setCharacterEncoding("utf-8");
//			res.setContentType("application/json; charset=utf-8");
			res.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
