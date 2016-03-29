package wood.item.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import wood.shop.dto.Category;
import wood.shop.dto.ParamTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public ArrayList<Category> categoryList(String queryId, ParamTO params) {
		
		return (ArrayList) mybatis.selectList(queryId, params);
	}

	@Override
	public Category selById(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(String queryid, Category category) {
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
