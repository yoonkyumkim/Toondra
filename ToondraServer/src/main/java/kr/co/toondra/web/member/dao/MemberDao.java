package kr.co.toondra.web.member.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDao extends BaseDao {

	public int getMemberListCount(PMap pMap) {
		return selectOne("Member.getMemberListCount", pMap);
	}
	
	public List<HashMap<String, Object>> getMemberList(PMap pMap) {
		return selectList("Member.getMemberList", pMap);
	}
}
