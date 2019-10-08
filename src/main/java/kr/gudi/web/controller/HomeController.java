package kr.gudi.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONObject;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sql;
	
	// home 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

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

	@RequestMapping("/test")
	public void test(HttpServletResponse res) {
		try {
			int a = 1;
			if(a == 1) {
				
				res.getWriter().write("test");
			} else {
				res.getWriter().write("tes124t");
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
