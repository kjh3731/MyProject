package kr.gudi.web.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@PostMapping("/login/kakao")
	public String kakao(HttpServletRequest req, HttpServletResponse res) {
		try {
			String url = "https://kauth.kakao.com/oauth/authorize";
			url	+= "?client_id=5e45e7bcbf5c5c786829735f9be1f6ac&redirect_uri=";
			url	+= URLEncoder.encode("http://gdj16.gudi.kr:20008/KakaoBack", "UTF-8");
			url	+= "&response_type=code";
			System.out.println(url);
			res.sendRedirect(url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	@RequestMapping("/KakaoBack")
	public void KakaoBack(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("KakaoBack");
		String code = req.getParameter("code");
		System.out.println(code);
		String url = "https://kauth.kakao.com/oauth/token";
	}
}
