package kr.co.toondra.api.community.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiFAQDao")
public class FAQDao extends BaseDao {

	public int getFAQListCount(HashMap<String, Object> param) {
		return selectOne("API.FAQ.getFAQListCount", param);
	}

	public List<HashMap<String, Object>> getFAQList(HashMap<String, Object> param) {
		return selectList("API.FAQ.getFAQList", param);
	}
	
}
