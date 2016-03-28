package wood.member.svc;

import java.util.ArrayList;
import java.util.Map;

import wood.shop.dto.MemberLevel;
import wood.shop.dto.ParamTO;

public interface MemberLevelService {
	public ArrayList<MemberLevel> memberLevelList(String queryId, ParamTO params);
	public MemberLevel selById(String queryid, Map<String, Object> map);
	public int insert(String queryid, MemberLevel memberlevel);
	public int update(String queryid, Map<String, Object> map);
	public int delete(String queryid, Map<String, Object> map);

}
