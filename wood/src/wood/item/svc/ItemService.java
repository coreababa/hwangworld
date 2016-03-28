package wood.item.svc;

import java.util.ArrayList;
import java.util.Map;

import wood.shop.dto.Item;
import wood.shop.dto.ParamTO;

public interface ItemService {
	public ArrayList<Item> itemList(String queryId, ParamTO params);

	public Item selById(String queryid, Map<String, Object> map);

	public int insert(String queryid, Item item);

	public int update(String queryid, Map<String, Object> map);

	public int delete(String queryid, Map<String, Object> map);
}
