package kr.co.spring.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.spring.common.CommonDAO;
import kr.co.spring.common.CommonUtil;
import kr.co.spring.common.SessionVo;

@Service
public class MemberServiceImpl extends CommonDAO implements MemberService {
	
	@Autowired
	CommonUtil commonUtil;
	
	protected Log log = LogFactory.getLog(MemberServiceImpl.class);
	
	@Override
	public ModelAndView loginProc(Map<String, Object> param, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		param.put("user_pw", commonUtil.sha256(param.get("user_pw").toString()));
		
		Map<String, Object> userInfo = super.selectMap("member.selectUserInfo", param);
		
		if(userInfo != null) {
			SessionVo sessionVo = new SessionVo();
			sessionVo.setLogin_idx(Integer.parseInt(userInfo.get("IDX").toString()));
			sessionVo.setLogin_id(userInfo.get("USER_ID").toString());
			sessionVo.setLogin_auth(userInfo.get("USER_AUTH").toString());
			sessionVo.setLogin_name(userInfo.get("USER_NAME").toString());
			session.setAttribute("sessionVo", sessionVo);
			mv.setViewName("redirect:/main/index.do");
		}else {
			mv.addObject("user_id", param.get("user_id").toString());
			mv.setViewName("redirect:/member/loginForm.do");
		}
		
		return mv;
	}
	
	@Override
	public Map<String, Object> overlapChk(Map<String, Object> param) throws Exception {
		Map<String, Object> json = new HashMap<String, Object>();
		
		if(super.select("member.selectUserIdx", param) == null) {
			json.put("result", true);
		}else {
			json.put("result", false);
		}
		
		return json;
	}

	@Override
	public ModelAndView registProc(Map<String, Object> param) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main/index.do"); 
		
		param.put("user_pw", commonUtil.sha256(param.get("user_pw").toString()));
		
		if(super.insert("member.insertMemberRegist", param) == 1) {
			mv.addObject("msg", "회원가입이 완료되었습니다.");
		}
		
		return mv;
	}

}
