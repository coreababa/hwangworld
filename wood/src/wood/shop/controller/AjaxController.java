package wood.shop.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import wood.item.svc.CategoryService;
import wood.item.svc.ItemService;
import wood.member.svc.MemberLevelService;
import wood.member.svc.MemberService;
import wood.shop.dto.Category;
import wood.shop.dto.Item;
import wood.shop.dto.Member;
import wood.shop.dto.MemberLevel;
import wood.shop.dto.ParamTO;	

@Controller
public class AjaxController {
	@Autowired
	private MemberService membersvc;
	@Autowired
	private ItemService itemsvc;
	@Autowired
	private MemberLevelService memberLevelsvc;
	@Autowired
	private CategoryService categorysvc;

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
	@ResponseBody
	@RequestMapping("/admin/object.do")
	public ArrayList<Member> mainpage(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="member.list2";
		ArrayList<Member> memberList= membersvc.memberList(queryId, params);
		return memberList;
	}
	
	@ResponseBody
	@RequestMapping("/admin/itemAjax.do")
	public ArrayList<Item> itemAjax(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="item.list2";
		ArrayList<Item> itemList= itemsvc.itemList(queryId, params);
		System.out.println(itemList);
		return itemList;
	}
	
	@ResponseBody
	@RequestMapping("/admin/member_level_Ajax.do")
	public ArrayList<MemberLevel> member_level_Ajax(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="memberlevel.list";
		ArrayList<MemberLevel> memberLevelList= memberLevelsvc.memberLevelList(queryId, params);
		System.out.println(memberLevelList);
		return memberLevelList;
		
	}
	
	@ResponseBody
	@RequestMapping("/admin/category_Ajax.do")
	public ArrayList<Category> category_Ajax(ModelAndView mav, ParamTO params, @RequestParam Map<String, Object> map){
		String queryId="category.list";
		ArrayList<Category> categorys= categorysvc.categoryList(queryId, params);
		System.out.println(categorys);
		return categorys;
		
	}
	
	
	

	
}
