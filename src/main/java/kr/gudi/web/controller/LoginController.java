package kr.gudi.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONObject;

@Controller
public class LoginController {

	@Autowired
	SqlSession sql;
	
	@RequestMapping("/localLogin")
	public String localLogin() {
		
		return "redirect:/";
	}
	
	// 로그인 id, pw check ajax
	@RequestMapping("/localLogin/check")
	public void localLoginCheck(HttpServletResponse res, HttpServletRequest req, HttpSession session) {
		try {
			HashMap<String, Object> paraMap = new HashMap<String, Object>();
			String sId = req.getParameter("sId"); 
			String sPw = req.getParameter("sPw");	
			paraMap.put("sId", sId);
			paraMap.put("sPw", sPw);
			
//			HashMap<String, Object> result = sql.selectOne("signUp.login", paraMap); 
//			System.out.println(result.get("count"));
			
			int count = sql.selectOne("signUp.login", paraMap);
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			if (sId ==  null || sPw == null || count == 0) {
				// 로그인 실패
				result.put("result", count);
				System.out.println("로그인 실패");
			} else {
				// 로그인 성공
				result.put("result", count);
				session = req.getSession();
				session.setAttribute("sId", sId);
				System.out.println(session.getAttribute("sId").toString() + " : " + session.getId());
			}
			res.getWriter().write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/";
	}
}
