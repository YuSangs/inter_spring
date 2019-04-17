package kr.co.spring.main;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	/**
	 * 메인 페이지
	 * 
	 * @return String
	 * */
	@RequestMapping("/main/index")
	public ModelAndView index(@RequestParam Map<String, Object> param) {
		ModelAndView mv = new ModelAndView("front/main/index");
		
		if(param.get("msg") != null) {
			mv.addObject("msg", param.get("msg").toString());
		}
		
		return mv;
	}
}
