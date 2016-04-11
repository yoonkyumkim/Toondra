package kr.co.toondra.api.coin.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiCoinDao")
public class CoinDao extends BaseDao {
	
	public String getMemberSeq(String loginKey) {
		return selectOne("API.Coin.getMemberSeq", loginKey);
	}
	
	public int getCoinMember(HashMap<String, Object> param) {
		return selectOne("API.Coin.getCoinMember", param);
	}

	public int getCoinHistoryTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Coin.getCoinHistoryTotalCnt", param);
	}
	
	public List<HashMap<String, Object>> getCoinProduct(HashMap<String, Object> param) {
		return selectList("API.Coin.getCoinProduct", param);
	}
	
	public List<HashMap<String, Object>> getCoinPurchaseHistory(HashMap<String, Object> param) {
		return selectList("API.Coin.getCoinPurchaseHistory", param);
	}
	
	public HashMap<String, Object> getCoinProductInfo(HashMap<String, Object> param) {
		return selectOne("API.Coin.getCoinProductInfo", param);
	}
	
	public int insertCoinPurchase(HashMap<String, Object> param) {
		return insert("API.Coin.insertCoinPurchase", param);
	}
	
	public int updateCoinPurchaseComplete(HashMap<String, Object> param) {
		return update("API.Coin.updateCoinPurchaseComplete", param);
	}
	
	public int getPurchaseCoin(HashMap<String, Object> param) {
		return selectOne("API.Coin.getPurchaseCoin", param);
	}
	
	public int updateMemberCoinAdd(HashMap<String, Object> param) {
		return update("API.Coin.updateMemberCoinAdd", param);
	}
	
	public List<HashMap<String, Object>> getCoinUsedList(HashMap<String, Object> param) {
		return selectList("API.Coin.getCoinUsedList", param);
	}

	public int getTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Coin.getTotalCnt", param);
	}
	
	public int getCoinProductTotalCnt() {
		return selectOne("API.Coin.getCoinProductTotalCnt");
	}
	
	
}
