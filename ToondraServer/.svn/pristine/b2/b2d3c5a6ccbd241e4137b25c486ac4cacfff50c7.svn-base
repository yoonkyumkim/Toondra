package kr.co.toondra.api.community.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiNoticeDao")
public class NoticeDao extends BaseDao {

	public int getNoticeListCount(HashMap<String, Object> param) {
		return selectOne("API.Notice.getNoticeListCount", param);
	}
	
	public List<HashMap<String, Object>> getNoticeList(HashMap<String, Object> param) {
		return selectList("API.Notice.getNoticeList", param);
	}
}
