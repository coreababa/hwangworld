package wood.member.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import wood.shop.dto.MemberLevel;
import wood.shop.dto.ParamTO;

@Repository
public class MemberLevelDAOImple implements MemberLevelDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public ArrayList<MemberLevel> memberLevelList(String queryId, ParamTO params) {
		return  (ArrayList) mybatis.selectList(queryId,params);
	}

	@Override
	public MemberLevel selById(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.selectOne(queryid, map);
	}

	@Override
	public int insert(String queryid, MemberLevel memberlevel) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mybatis.update(queryid, map);
	}

	@Override
	public int delete(String queryid, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
