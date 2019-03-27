package kr.co.spring.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.spring.common.CommonDAO;

@Service
public class MemberServiceImpl extends CommonDAO implements MemberService {
	
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
}
