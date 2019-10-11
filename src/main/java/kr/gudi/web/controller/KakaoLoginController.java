package kr.gudi.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONObject;

@Controller
public class KakaoLoginController {
	
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping("/login/kakao")
	public void login(HttpServletRequest req, HttpServletResponse res) {
	
			try {
				String url = "https://kauth.kakao.com/oauth/authorize";
				url += "?client_id=5e45e7bcbf5c5c786829735f9be1f6ac&redirect_uri=";
				url += URLEncoder.encode("http://localhost:8080/KakaoLogin", "UTF-8");
				url += "&response_type=code";
				System.out.println("/login : " + url);
				res.sendRedirect(url);
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	@RequestMapping("/KakaoLogin")
	public void kakao(HttpServletRequest req, HttpServletResponse res) {
		try {
			String code = req.getParameter("code");
			System.out.println("code : " + code);
			String url = "https://kauth.kakao.com/oauth/token";
			url += "?client_id=5e45e7bcbf5c5c786829735f9be1f6ac&redirect_uri=";
			url += URLEncoder.encode("http://localhost:8080/KakaoLogin", "UTF-8");
			url += "&code=" + code;
			url += "&grant_type=authorization_code";
			System.out.println("/kakaoLogin : " + url);
			
			URL u = new URL(url);
			HttpURLConnection urlConnect = (HttpURLConnection) u.openConnection();
			urlConnect.setRequestMethod("POST");
			int resCode = urlConnect.getResponseCode();
			//System.out.println(resCode);
			//400 문법오류
			//500 네트워크 오류
			if(resCode == 200) {
				InputStream input = urlConnect.getInputStream();
				InputStreamReader inputReader = new InputStreamReader(input, "UTF-8");
				BufferedReader br = new BufferedReader(inputReader);
				String line = "";
				String result = "";
				while((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("result : " + result);
				
				JSONObject jObject = JSONObject.fromObject(result);
				String access_token = jObject.getString("access_token");
				System.out.println("access_token : " + access_token);
				
				String userUrl = "https://kapi.kakao.com/v2/user/me";
				userUrl += "?access_token=" + access_token;
				System.out.println("userUrl : " + userUrl);
				
				u = new URL(userUrl);
				urlConnect = (HttpURLConnection)u.openConnection();
				urlConnect.setRequestMethod("POST");
				resCode = urlConnect.getResponseCode();
				if(resCode == 200) {
					input = urlConnect.getInputStream();
					inputReader = new InputStreamReader(input, "UTF-8");
				    br = new BufferedReader(inputReader);
					line = "";
					result = "";
					while((line = br.readLine()) != null) {
						result += line;
					}
					System.out.println("userUrl result : " + result);
					JSONObject jsonUser = JSONObject.fromObject(result);
					
					String id = jsonUser.get("id").toString();
					JSONObject properties = (JSONObject) jsonUser.get("properties");
					
					String nickname = properties.getString("nickname");
					String profile_image = properties.getString("profile_image");
					String thumbnail_image = properties.getString("thumbnail_image");
					
					HashMap<String, Object> resultMap = new HashMap<String, Object>();
					resultMap.put("id", id);
					resultMap.put("nickname", nickname);
					resultMap.put("profile_image", profile_image);
					resultMap.put("thumbnail_image", thumbnail_image);
//					System.out.println("resultMap : " + resultMap.toString());
					
//					HashMap<String, Object> sessionMap = (HashMap<String, Object>) session.getAttribute("resultMap");
//					System.out.println(sessionMap.toString());
//					System.out.println(sessionMap.get("id").toString());
//					session.setAttribute("id", id);
//					String sessionId = session.getAttribute("id").toString();
//					System.out.println("sessionId : " + sessionId);
					
//					sql.selectOne("user.select");
					
					
//					String checkId = sql.select("user.select", (String) resultMap.get(id));
					System.out.println(id);
//					System.out.println(checkId);
//					if(id != checkId) {
//						sql.insert("user.insert", resultMap);
//					}
				}
				br.close();
				input.close();
			}
			res.sendRedirect("/");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
