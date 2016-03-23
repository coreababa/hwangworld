package wood.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import wood.member.svc.MemberService;
import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

@Controller
public class MemberController {
	@Autowired
	private MemberService membersvc;
	@RequestMapping("/index.do")
	public ModelAndView mainpage(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="member.list2";
		ArrayList<Member> memberList= membersvc.memberList(queryId, params);
		mav.addObject("memberList", memberList);
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/login_form.do")
	public ModelAndView login_form(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		mav.addObject("include_file", "login_form.jsp");
		mav.setViewName("/member/member");
		return mav;
	}
	
	@RequestMapping("/regist_form.do")
	public ModelAndView regist_form(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		mav.addObject("include_file", "regist_form.jsp");
		mav.setViewName("/member/member");
		return mav;
	}
	
	
	@RequestMapping("/login.do")
	public ModelAndView login(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map,HttpSession session){
		String queryid = "member.selById";
		//map.put("id", (String) map.get("id")) ;
		//map.put("passwd", (String) map.get("passwd")) ;
		Member member = membersvc.selById(queryid, map);
		session.setAttribute("myInfo", member);
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	@RequestMapping("/regist.do")
	public ModelAndView regist(HttpServletRequest request, ModelAndView mav, ParamTO params, Member member, HttpSession session){
		String queryid = "member.insert";
		//map.put("id", (String) map.get("id")) ;
		//map.put("passwd", (String) map.get("passwd")) ;
		member.setRemote_addr_str(request.getRemoteAddr());
		int re = membersvc.insert(queryid, member);
		session.setAttribute("myInfo", member);
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
	@ResponseBody	
	@RequestMapping(value="/admin/member_update.do")
	public void update(HttpServletRequest request, ModelAndView mav,@RequestParam Map<String, Object> map, HttpSession session){
		String queryid = "member.update";
		
		//map.put("id", (String) map.get("id")) ;
		//map.put("passwd", (String) map.get("passwd")) ;
		map.put("remote_addr_str", request.getRemoteAddr());
		
		
		int re = membersvc.update(queryid, map);
		//session.setAttribute("myInfo", member);
		//mav.setViewName("redirect:/admin/index.do");
		//return mav;
	}
	@RequestMapping("/admin/member_form.do")
	@ResponseBody
	public Member memberForm(@RequestParam int member_no,Map<String, Object> map){
		String queryid = "member.selById";
		map.put("member_no", member_no);
		
		//map.put("id", (String) map.get("id")) ;
		//map.put("passwd", (String) map.get("passwd")) ;
		Member member = membersvc.selById(queryid, map);
		
		return member;
	}
		
	@RequestMapping("/logout.do")
	public ModelAndView logout(ModelAndView mav,HttpSession session){
		session.removeAttribute("myInfo");
		session.invalidate();
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
}
