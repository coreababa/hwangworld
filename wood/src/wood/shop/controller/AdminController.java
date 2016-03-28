package wood.shop.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import wood.item.svc.ItemService;
import wood.member.svc.MemberLevelService;
import wood.member.svc.MemberService;
import wood.shop.dto.Item;
import wood.shop.dto.Member;
import wood.shop.dto.MemberLevel;
import wood.shop.dto.ParamTO;

@Controller
public class AdminController {
	@Autowired
	private MemberService membersvc;
	@Autowired
	private MemberLevelService memberLevelsvc;
	@Autowired
	private ItemService itemsvc;
	
	@RequestMapping("/admin/index.do")
	public ModelAndView mainpage(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="member.list2";
		ArrayList<Member> memberList= membersvc.memberList(queryId, params);
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/index");
		return mav;
	}
	
	@RequestMapping("/admin/member.do")
	public ModelAndView member(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="member.list2";
		ArrayList<Member> memberList= membersvc.memberList(queryId, params);
		mav.addObject("memberList", memberList);
		mav.addObject("include_file","./member/member.jsp");
		mav.setViewName("admin/index");
		return mav;
	}
	@RequestMapping("/admin/memberLevel.do")
	public ModelAndView memberLevel(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="memberlevel.list";
		ArrayList<MemberLevel> memberLevelList= memberLevelsvc.memberLevelList(queryId, params);
		mav.addObject("memberList", memberLevelList);
		mav.addObject("include_file","./member/member_level.jsp");
		mav.setViewName("admin/index");
		return mav;
	}
	
	
		
	
	@RequestMapping("/admin/item.do")
	public ModelAndView item(ModelAndView mav, ParamTO params){
		String queryId = "member.list2";
		ArrayList<Item> itemList = itemsvc.itemList(queryId, params);
		mav.addObject("itemList", itemList);
		mav.addObject("include_file","./item/item.jsp");
		mav.setViewName("admin/index");
		return mav;
	}
	
}
