package wood.member.svc;

import java.util.ArrayList;
import java.util.Map;

import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

public interface MemberService {

	public ArrayList<Member> memberList(String queryId, ParamTO params);

	public Member selById(String queryid, Map<String, Object> map);
}
