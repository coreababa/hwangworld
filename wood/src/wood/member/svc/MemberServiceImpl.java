package wood.member.svc;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import wood.member.dao.MemberDAO;
import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO MemberDAO;
	@Override
	public ArrayList<Member> memberList(String queryId, ParamTO params) {
		return MemberDAO.memberList(queryId, params);
	}

	@Override
	public Member selById(String queryid, Map<String, Object> map) {
		return MemberDAO.selById(queryid, map);
	}

	@Override
	public int insert(String queryid, Member member) {
		return MemberDAO.insert(queryid, member);
	}

	@Override
	public int update(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return MemberDAO.update(queryid, map);
	}
	
}
