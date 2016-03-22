package wood.shop.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import wood.member.svc.MemberService;
import wood.shop.dto.Member;	

@Controller
public class AjaxController {
	@Autowired
	private MemberService membersvc;

	@RequestMapping(value="/mem_chk.do", produces = "application/text; charset=utf8")
	@ResponseBody 
	public String mem_chk(@RequestParam Map<String, Object> map) {
		
		String chk="0";
		String queryid = "member.selById";
		map.put("id", map.get("id_str"));
		Member member = membersvc.selById(queryid, map);
		if (member!= null) {
			if (member.getId_str().equals(map.get("id"))) {
				chk = "1";
			}
		}
		
		return chk;
	}
}
