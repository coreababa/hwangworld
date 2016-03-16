package wood.member.svc;

import java.util.ArrayList;

import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

public interface MemberService {
	
	 public ArrayList<Member> memberList(String queryId, ParamTO params);
}
