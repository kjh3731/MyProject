package kr.gudi.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.gudi.web.bean.HomeBean;

@Controller
public class MettingController {
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping("/metting")
	public String metting(Model model, HomeBean hb) {
		model.addAttribute("list", sql.selectList("metting.select", hb));
		
		return "metting";
	}
	
	@RequestMapping("/metting/search")
	public String search() {
		
	 	return "redirect:/metting";
	}
	
	@RequestMapping("/metting/write")
	public String mWrite(HttpSession session) {
		String returnUrl = "";
		if(session.getAttribute("sId") == null) {
			System.out.println("세션이 없는데 글을 쓰려고 한다");
			returnUrl = "redirect:/metting";
		} else {
			returnUrl = "mWrite";
		}
		return returnUrl;
	}
	
	@PostMapping("/metting/write/{key}")
	public String crud(@PathVariable("key") String key, HomeBean hb, HttpSession session) {
		switch (key) {
		case "insert":
			String mId = session.getAttribute("sId").toString();
			hb.setmId(mId);
			sql.insert("metting.insert", hb);
			break;

		default:
			break;
		}
		
		return "redirect:/metting";
	}
	
	@RequestMapping("/metting/read/{key}")
	public String view(@PathVariable("key") String key, HomeBean hb, Model model) {
		hb.setmNo(key);
		model.addAttribute("read", sql.selectOne("read.select", hb));
		return "readMore";
	}
	
	@PostMapping("/resources/upload")
	public String file(MultipartFile file, HttpServletRequest req, HttpServletResponse res) {
		System.out.println(file.getOriginalFilename());
		try {
			String fileName = file.getOriginalFilename();
			// 데이터 가져오기
			byte [] data = file.getBytes();
			// 프로젝트 경로 받기
			String realPath = req.getSession().getServletContext().getRealPath("/");
			// 저장 경로 + 파일명 정의
			String path = realPath + "\\src\\main\\webapp\\resources\\upload\\" + fileName;
			// 파일 객체 생성
			File f = new File(path);
			// 출력 객체 생성 + 파일 객체 넣기
			OutputStream os = new FileOutputStream(f);
			// 가져온 데이터 출력 객체에 넣기
			os.write(data);
			String callback = req.getParameter("CKEditorFuncNum");
			
			PrintWriter pw = res.getWriter();
			String fileUrl = "" + fileName;
			
			pw.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
			pw.flush();
			// 출력 객체 종료
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
