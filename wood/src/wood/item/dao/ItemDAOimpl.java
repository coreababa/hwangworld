package wood.item.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wood.shop.dto.Item;
import wood.shop.dto.ParamTO;
@Repository
public class ItemDAOimpl implements ItemDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public ArrayList<Item> itemList(String queryId, ParamTO params) {
		return (ArrayList) mybatis.selectList(queryId, params);
	}

	@Override
	public Item selById(String queryid, Map<String, Object> map) {
		return mybatis.selectOne(queryid, map);
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
