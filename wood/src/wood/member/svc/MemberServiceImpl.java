package wood.member.svc;

import java.util.ArrayList;

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
	
}
