package kr.co.spring.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	/**
	 * 메인 페이지
	 * 
	 * @return String
	 * */
	@RequestMapping("/main/index")
	public String index() {
		return "front/main/index";
	}
}
