package kr.co.toondra.web.community.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class InquiryDao extends BaseDao {

	public List<HashMap<String, Object>> getInquiryCategory() {
		return selectList("Inquiry.getInquiryCategory");
	}

	public int getInquiryListCount(PMap pMap) {
		return selectOne("Inquiry.getInquiryListCount", pMap);
	}

	public List<HashMap<String, Object>> getInquiryList(PMap pMap) {
		return selectList("Inquiry.getInquiryList", pMap);
	}

	public HashMap<String, Object> getInquiry(PMap pMap) {
		return selectOne("Inquiry.getInquiry", pMap);
	}
	
	public int answerInquiry(PMap pMap) {
		return update("Inquiry.answerInquiry", pMap);
	}

}
