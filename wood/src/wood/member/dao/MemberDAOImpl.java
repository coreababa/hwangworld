package wood.member.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<Member> memberList(String queryId, ParamTO params) {
		return (ArrayList) sqlSession.selectList(queryId, params);
		
	}
	
	

}
