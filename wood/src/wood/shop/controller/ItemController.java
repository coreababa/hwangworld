package wood.shop.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import wood.item.svc.ItemService;
import wood.shop.dto.Item;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemsvc; 
	@RequestMapping("/admin/item_form.do")
	@ResponseBody
	public Item itemForm(@RequestParam int item_no, Map<String, Object> map) {
		String queryid = "item.selById";
		map.put("sel", "item_no");
		map.put("item_no", item_no);
		Item item = itemsvc.selById(queryid, map);
		return item;
	}
}
