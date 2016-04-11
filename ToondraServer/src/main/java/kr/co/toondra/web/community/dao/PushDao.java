package kr.co.toondra.web.community.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class PushDao extends BaseDao {

	public int getPushListCount(PMap pMap) {
		return selectOne("Push.getPushListCount", pMap);
	}

	public List<HashMap<String, Object>> getPushList(PMap pMap) {
		return selectList("Push.getPushList", pMap);
	}
	
	public int insertPush(PMap pMap) {
		return insert("Push.insertPush", pMap);
	}
	
	public int updatePush(PMap pMap) {
		return update("Push.updatePush", pMap);
	}

	public int deletePush(List<String> pushSeqList) {
		return delete("Push.deletePush", pushSeqList);
	}

	public boolean checkBefreUpdate(String pushSeq) {
		return selectOne("Push.checkBefreUpdate", pushSeq);
	}
	
	public int updatePushPost(PMap pMap) {
		return update("Push.updatePushPost", pMap);
	}

	public HashMap<String, Object> getPush(PMap pMap) {
		return selectOne("Push.getPush", pMap);
	}
}
