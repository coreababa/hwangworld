package wood.member.svc;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wood.member.dao.MemberLevelDAO;
import wood.shop.dto.MemberLevel;
import wood.shop.dto.ParamTO;
@Service
@Transactional
public class MemberLevelServiceImpl implements MemberLevelService {
	@Autowired
	private MemberLevelDAO memberLevelDAO;
	@Override
	public ArrayList<MemberLevel> memberLevelList(String queryId, ParamTO params) {
		return memberLevelDAO.memberLevelList(queryId, params);
	}

	@Override
	public MemberLevel selById(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return  memberLevelDAO.selById(queryid, map);
	}

	@Override
	public int insert(String queryid, MemberLevel memberlevel) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String queryid, Map<String, Object> map) {
		return memberLevelDAO.update(queryid, map);
	}

	@Override
	public int delete(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
