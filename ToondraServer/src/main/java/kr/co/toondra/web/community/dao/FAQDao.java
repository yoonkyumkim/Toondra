package kr.co.toondra.web.community.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class FAQDao extends BaseDao {

	public int getFAQListCount(PMap pMap) {
		return selectOne("FAQ.getFAQListCount", pMap);
	}

	public List<HashMap<String, Object>> getFAQList(PMap pMap) {
		return selectList("FAQ.getFAQList", pMap);
	}
	
	public int insertFAQ(PMap pMap) {
		return insert("FAQ.insertFAQ", pMap);
	}
	
	public int updateFAQ(PMap pMap) {
		return update("FAQ.updateFAQ", pMap);
	}

	public int deleteFAQ(PMap pMap) {
		return delete("FAQ.deleteFAQ", pMap);
	}

	public int updateFAQPost(PMap pMap) {
		return update("FAQ.updateFAQPost", pMap);
	}

	public HashMap<String, Object> getFAQ(PMap pMap) {
		return selectOne("FAQ.getFAQ", pMap);
	}
}
