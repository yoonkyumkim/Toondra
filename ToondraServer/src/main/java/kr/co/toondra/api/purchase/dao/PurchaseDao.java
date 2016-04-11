package kr.co.toondra.api.purchase.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;


@Repository("apiPurchaseDao")
public class PurchaseDao extends BaseDao {
	
	public HashMap<String, Object> getMemberInfo(HashMap<String, Object> param) {
		return selectOne("API.Purchase.getMemberInfo", param);
	}
	
	public HashMap<String, Object> getContentInfo(HashMap<String, Object> param) {
		return selectOne("API.Purchase.getContentInfo", param);
	}
	
	public int insertContentPurcharse(HashMap<String, Object> param) {
		return insert("API.Purchase.insertContentPurcharse", param);
	}
	
	public int updateMemberInfo(HashMap<String, Object> param) {
		return update("API.Purchase.updateMemberInfo", param);
	}
	
	public String getMemberSeq(String loginKey) {
		return selectOne("API.Inquiry.getMemberSeq", loginKey);
	}
	
	public int deletePurchaseContent(HashMap<String, Object> param) {
		return update("API.Purchase.deletePurchaseContent", param);
	}
	
	public List<HashMap<String, Object>> getPurchaseContentList(HashMap<String, Object> param) {
		return selectList("API.Purchase.getPurchaseContentList", param);
	}
	
	public int getTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Purchase.getTotalCnt", param);
	}
	
}
