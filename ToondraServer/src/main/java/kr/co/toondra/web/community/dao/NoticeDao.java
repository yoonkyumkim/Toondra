package kr.co.toondra.web.community.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class NoticeDao extends BaseDao {

	public int getNoticeListCount(PMap pMap) {
		return selectOne("Notice.getNoticeListCount", pMap);
	}

	public List<HashMap<String, Object>> getNoticeList(PMap pMap) {
		return selectList("Notice.getNoticeList", pMap);
	}
	
	public int insertNotice(PMap pMap) {
		return insert("Notice.insertNotice", pMap);
	}
	
	public int updateNotice(PMap pMap) {
		return update("Notice.updateNotice", pMap);
	}

	public int deleteNotice(PMap pMap) {
		return update("Notice.deleteNotice", pMap);
	}

	public int updateNoticePost(PMap pMap) {
		return update("Notice.updateNoticePost", pMap);
	}

	public HashMap<String, Object> getNotice(PMap pMap) {
		return selectOne("Notice.getNotice", pMap);
	}
}
