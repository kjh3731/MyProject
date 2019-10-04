package kr.gudi.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.gudi.web.bean.SignUpBean;
import net.sf.json.JSONObject;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
//		List<HomeBean> list = sql.selectList("home.select");
//		model.addAttribute("list", list);
		return "home";
	}
	
	// home화면 ajax
	@RequestMapping("/home")
	public void ajaxHome(HttpServletRequest req, HttpServletResponse res) {
		try {
			HashMap<String, Object> result = new HashMap<String, Object>();
			HashMap<String, Object> bufferMap = new HashMap<String, Object>();
			
			bufferMap.put("year", req.getParameter("year"));
			bufferMap.put("month", req.getParameter("month"));
			bufferMap.put("day", req.getParameter("day"));
//			System.out.println(sql.selectList("home.date-select", bufferMap).toString());
			result.put("result", sql.selectList("home.date-select", bufferMap));
			res.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
/*	
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
*/	
	// 회원가입 화면
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "signUp";
	}
	
	// 회원가입 id check ajax
	@RequestMapping("/signUp/check")
	public void SignUpCheck(HttpServletResponse res, HttpServletRequest req) {
		try {
			String id = req.getParameter("id");
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			// 수정 필요
			result.put("result", sql.selectList("signUp.idCheck", id));
			res.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/signUp/insert")
	public String insert(SignUpBean sb) {
		sql.insert("signUp.insert", sb);
		System.out.println(sb.toString());
		return "redirect:/";
	}
	
	@PostMapping("/localLogin")
	public String localLogin() {
		
		return "redirect:/";
	}
	
	// 로그인 id, pw check ajax
	@RequestMapping("/localLogin/check")
	public void localLoginCheck(HttpServletResponse res, HttpServletRequest req) {
		String id = req.getParameter("sId");
		String pw = req.getParameter("sPw");
		// 수정필요 값 못받아옴 login.jsp
		System.out.println(id);
		System.out.println(pw);
//		sql.selectList("signUp.login", sb);
//		System.out.println(sb.toString());
		
		
	}
}
