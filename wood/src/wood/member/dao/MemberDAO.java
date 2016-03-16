package wood.member.dao;

import java.util.ArrayList;

import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

public interface MemberDAO {
	public ArrayList<Member> memberList(String queryId, ParamTO params);
}
