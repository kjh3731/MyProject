package kr.gudi.web.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LoginController {

	@Autowired
	SqlSession sql;
	
	
}
