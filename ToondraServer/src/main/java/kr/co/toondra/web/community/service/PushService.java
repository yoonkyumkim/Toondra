package kr.co.toondra.web.community.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.web.community.dao.PushDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PushService {

	@Autowired
	private PushDao dao;

	public HashMap<String, Object> getPushList(PMap pMap) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int pushListCount = dao.getPushListCount(pMap);
		List<HashMap<String, Object>> pushList = dao.getPushList(pMap);
		
		result.put("iTotalRecords", pushListCount);
		result.put("iTotalDisplayRecords", pushListCount);		
		result.put("aaData", pushList);
		
		return result;
	}

	public HashMap<String, Object> getPush(PMap pMap) {
		return dao.getPush(pMap);
	}
	
	public boolean insertPush(PMap pMap) throws Exception {
		
		pMap.put("type", "00"); //00 : 일반알림 / 01 :작품별 알림 
		pMap.put("sendState", "00"); //00 : 대기 / 01 : 발송중 / 02 : 완료 / 03 : 실패
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		
		dao.insertPush(pMap);
		
		return true;
	}

	public boolean updatePush(PMap pMap) throws Exception {

		if(!dao.checkBefreUpdate(pMap.getString("pushSeq"))) {
			throw new LogicException("대기 상태가 아닙니다.", "900");
		}
		
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		
		dao.updatePush(pMap);
		
		return true;
	}

	public boolean deletePush(PMap pMap) throws Exception {

		List<String> pushSeqList = Arrays.asList(pMap.getString("pushSeqStr").split("\\|"));
		for(String pushSeq : pushSeqList) {
			if(!dao.checkBefreUpdate(pushSeq)) {
				throw new LogicException("대기 상태가 아닙니다.", "900");
			}
		}
		dao.deletePush(pushSeqList);
		
		return true;
	}

	public boolean updatePushPost(PMap pMap) {
		
		List<String> pushSeqList = Arrays.asList(pMap.getString("pushSeqStr").split("\\|"));
		pMap.put("list", pushSeqList);
		dao.updatePushPost(pMap);
		
		return true;
	}
	
}
