package kr.co.spring.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberContoller {

	@Autowired
	MemberService service;
	
	/**
	 * 로그인 페이지
	 * 
	 * @return String
	 * */
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "front/member/loginForm";
	}
	
}
