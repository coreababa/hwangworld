package wood.item.svc;

import java.util.ArrayList;
import java.util.Map;
import wood.shop.dto.Category;
import wood.shop.dto.ParamTO;

public interface CategoryService {
	public ArrayList<Category> categoryList(String queryId, ParamTO params);

	public Category selById(String queryid, Map<String, Object> map);

	public int insert(String queryid, Category category);

	public int update(String queryid, Map<String, Object> map);

	public int delete(String queryid, Map<String, Object> map);
}
