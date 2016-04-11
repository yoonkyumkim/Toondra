package kr.co.toondra.web.member.service;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.member.dao.MemberDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

	public HashMap<String, Object> getMemberList(PMap pMap) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int memberListCount = dao.getMemberListCount(pMap);
		List<HashMap<String, Object>> memberList = dao.getMemberList(pMap);
		
		result.put("iTotalRecords", memberListCount);
		result.put("iTotalDisplayRecords", memberListCount);		
		result.put("aaData", memberList);
		
		return result;
	}
	
}
