package wood.member.dao;

import java.util.List;

import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

public interface MemberDAO {

	public int registMember(Member member);
	
	public List<Member> listMember(ParamTO ParamTO);
	
	public Member getMember(int member_no);
	
	public int modifyMember(Member member);
	
	public int modifyPw(String oldPassword,String newPassword,int member_no);
	
	public int deleteMember(int member_no);

	public int totalCnt();
}
