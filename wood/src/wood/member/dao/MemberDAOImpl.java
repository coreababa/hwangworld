package wood.member.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import wood.shop.dto.Member;
import wood.shop.dto.ParamTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;


	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public ArrayList<Member> memberList(String queryId, ParamTO params) {
		return (ArrayList) mybatis.selectList(queryId, params);
	}

	@Override
	public Member selById(String queryid, Map<String, Object> map) {
		return mybatis.selectOne(queryid, map);
	}

	@Override
	public int insert(String queryid, Member member) {
		return mybatis.insert(queryid, member);
	}
	@Override
	public int update(String queryid,  Map<String, Object> map) {
		return mybatis.update(queryid, map);
	}
	@Override
	public int delete(String queryid, Map<String, Object> map) {
		return mybatis.update(queryid, map);
	}

}
