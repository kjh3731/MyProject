package kr.gudi.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.gudi.web.bean.SignUpBean;
import net.sf.json.JSONObject;

@Controller
public class SignUpController {
		
		@Autowired
		SqlSession sql;
	
		// 회원가입 화면
		@RequestMapping("/signUp")
		public String signUp() {
			
			return "signUp";
		}
		
		// 회원가입 id 중복 check ajax
		@RequestMapping("/signUp/check")
		public void SignUpCheck(HttpServletResponse res, HttpServletRequest req) {
			try {
				String id = req.getParameter("id");
				
				HashMap<String, Object> result = new HashMap<String, Object>();
				
				result.put("result", sql.selectList("signUp.idCheck", id));
				res.getWriter().write(JSONObject.fromObject(result).toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 회원가입 정보 데이터베이스에 넣기
		@PostMapping("/signUp/insert")
		public String insert(SignUpBean sb) {
			sql.insert("signUp.insert", sb);
//			System.out.println(sb.toString());
			return "redirect:/";
		}
		
		@RequestMapping("/findPw")
		public String findPw() {
			
			return "findPw";
		}
		
		@RequestMapping("/findPw/email")
		public void findEmail(HttpServletRequest req, HttpServletResponse res) {
			String sId = req.getParameter("sId");
			try {
				HashMap<String, Object> result = new HashMap<String, Object>();
				result.put("result", sql.update("signUp.updatePw", sId));
				
				System.out.println(sql.update("signUp.updatePw", sId));
				res.getWriter().write(JSONObject.fromObject(result).toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
}