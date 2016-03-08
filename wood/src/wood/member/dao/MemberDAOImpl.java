package wood.member.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionFactory factory;
	
	private SqlSession getSession(){
		return factory.openSession();
	}
	
	private void closeSession(SqlSession session){
		session.close();
	}
	
	@Override
	public int registMember(Member member) {
		SqlSession session = getSession();
		int result = session.insert("member.regist", member);
		closeSession(session);
		return result;
	}

	@Override
	public int modifyMember(Member member) {
		SqlSession session = getSession();
		int result = session.update("member.modifyMember",member);
		closeSession(session);
		return result;
	}

	@Override
	public int deleteMember(int Member_no) {
		SqlSession session = getSession();
		int result = session.update("member.delete",Member_no);
		closeSession(session);
		return result;
	}

	@Override
	public int modifyPw(String oldPassword, String newPassword,int member_no) {
		SqlSession session = getSession();
		HashMap<String,String> hashMap = new HashMap<String,String>();
		hashMap.put("oldPassword", oldPassword);
		hashMap.put("newPassword", newPassword);	
		hashMap.put("member_no", String.valueOf(member_no));
		int result = session.insert("member.modifyPw", hashMap);
		closeSession(session);
		return result;
		
	}

	@Override
	public Member getMember(int member_no) {
		SqlSession session = getSession();
		Member member = session.selectOne("member.detail",member_no);
		closeSession(session);
		return member;
	}

	@Override
	public int totalCnt() {
		SqlSession session = getSession();
		int result = session.selectOne("member.totalcnt");
		closeSession(session);
		return result;
	}

	@Override
	public List<Member> listMember(ParamTO ParamTO) {
		// TODO Auto-generated method stub
		return null;
	}

}
