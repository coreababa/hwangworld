package wood.item.svc;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wood.item.dao.CategoryDAO;
import wood.shop.dto.Category;
import wood.shop.dto.ParamTO;
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public ArrayList<Category> categoryList(String queryId, ParamTO params) {
		return categoryDAO.categoryList(queryId, params);
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
