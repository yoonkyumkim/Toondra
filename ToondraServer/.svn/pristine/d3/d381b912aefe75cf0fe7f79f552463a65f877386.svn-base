package kr.co.toondra.api.community.dao;

import java.util.HashMap;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiInquiryDao")
public class InquiryDao extends BaseDao{
	
	public int insertInquiry(HashMap<String, Object> param) {
		return insert("API.Inquiry.insertInquiry", param);
	}
	
	public String getMemberSeq(String loginKey) {
		return selectOne("API.Inquiry.getMemberSeq", loginKey);
	}
}
