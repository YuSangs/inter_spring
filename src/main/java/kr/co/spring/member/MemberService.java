package kr.co.spring.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {

	ModelAndView loginProc(Map<String, Object> param, HttpSession session) throws Exception;
	
	Map<String, Object> overlapChk(Map<String, Object> param) throws Exception;

	ModelAndView registProc(Map<String, Object> param) throws Exception;

	

}
