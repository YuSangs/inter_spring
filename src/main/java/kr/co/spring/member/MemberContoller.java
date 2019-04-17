package kr.co.spring.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView loginForm(@RequestParam Map<String, Object> param) throws Exception {
		ModelAndView mv = new ModelAndView("front/member/loginForm");
		
		if(param.get("user_id") != null) {
			mv.addObject("user_id", param.get("user_id").toString());
		}
		
		return mv;
	}
	
	/**
	 * 로그인 실행
	 * 
	 * @param Map<String, Object>
	 * @return ModelAndView
	 * */
	@RequestMapping("/member/loginProc")
	public ModelAndView loginProc(@RequestParam Map<String, Object> param, HttpSession session) throws Exception {
		return service.loginProc(param, session);
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
	
	/**
	 * 회원가입 실행
	 * 
	 * @param Map<String, Object>
	 * @return ModelAndView
	 * */
	@RequestMapping("/member/registProc")
	public ModelAndView registProc(@RequestParam Map<String, Object> param) throws Exception {
		return service.registProc(param);
	}
	
	/**
	 * 로그아웃 실행
	 * 
	 * @param HttpSession
	 * @return String
	 * */
	@RequestMapping("/member/logoutProc")
	public String logoutProc(HttpSession session) throws Exception {
		session.removeAttribute("sessionVo");
		return "redirect:/main/index.do";
	}
	
}
