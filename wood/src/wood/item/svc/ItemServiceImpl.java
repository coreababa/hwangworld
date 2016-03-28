package wood.item.svc;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wood.item.dao.ItemDAO;
import wood.shop.dto.Item;
import wood.shop.dto.ParamTO;
@Service
@Transactional
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemDAO itemDAO;
	@Override
	public ArrayList<Item> itemList(String queryId, ParamTO params) {
		return itemDAO.itemList(queryId, params);
		
	}

	@Override
	public Item selById(String queryid, Map<String, Object> map) {
		return itemDAO.selById(queryid, map);
	}

	@Override
	public int insert(String queryid, Item item) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
