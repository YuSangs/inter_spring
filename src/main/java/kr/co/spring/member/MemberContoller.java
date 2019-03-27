package kr.co.spring.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberContoller {

	@Autowired
	MemberService service;
	
	/**
	 * 로그인 페이지
	 * gtx2060 , gtx1660ti 
	 * @return String
	 * */
	@RequestMapping("/member/loginForm")
	public String loginForm() throws Exception {
		return "front/member/loginForm";
	}
	
	/**
	 * 회원가입 페이지
	 * 
	 * @return String
	 * */
	@RequestMapping("/member/registForm")
	public String registForm() throws Exception {
		return "front/member/registForm";
	}
	
	/**
	 * 아이디 중복 확인
	 * 
	 * @param Map<String, Object>
	 * @return Map<String, Object>
	 * */
	@RequestMapping("/member/overlapChk")
	public @ResponseBody Map<String, Object> overlapChk(@RequestParam Map<String, Object> param) throws Exception {
		return service.overlapChk(param);
	}
	
}
