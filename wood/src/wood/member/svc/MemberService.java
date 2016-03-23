package wood.member.svc;

import java.util.ArrayList;
import java.util.Map;

import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

public interface MemberService {

	public ArrayList<Member> memberList(String queryId, ParamTO params);

	public Member selById(String queryid, Map<String, Object> map);

	public int insert(String queryid, Member member);

	public int update(String queryid, Map<String, Object> map);
}
