package kr.co.toondra.api.work.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiWorkDao")
public class WorkDao extends BaseDao {
	
	
	public List<HashMap<String, Object>> getWorkList(HashMap<String, Object> param) {
		return selectList("API.Work.getWorkList", param);
	}
	
	public int getWorkTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Work.getWorkTotalCnt", param);
	}
	
	public String getMemberSeq(HashMap<String, Object> param) {
		return selectOne("API.Work.getMemberSeq", param);
	}
	
	public List<String> getWorkSeqList(String memberSeq) {
		return selectList("API.Work.getWorkSeqList", memberSeq);
	}
	
	public List<HashMap<String, Object>> getMemberWorkViewList(HashMap<String, Object> param) {
		return selectList("API.Work.getMemberWorkViewList", param);
	}
	
	public int getContentTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Work.getContentTotalCnt", param);
	}
	
	public List<HashMap<String, Object>> getContentList(HashMap<String, Object> param) {
		return selectList("API.Work.getContentList", param);
	}
	
	public HashMap<String, Object> getWorkInfo(HashMap<String, Object> param) {
		return selectOne("API.Work.getWorkInfo", param);
	}
	
	public int updateWorkPushState(HashMap<String, Object> param) {
		return update("API.Work.updateWorkPushState", param);
	}
	
	public int insertWorkPushState(HashMap<String, Object> param) {
		return insert("API.Work.insertWorkPushState", param);
	}
	
	public int getWorkPushState(HashMap<String, Object> param) {
		return selectOne("API.Work.getWorkPushState", param);
	}
	
	public int getWorkViewState(HashMap<String, Object> param) {
		return selectOne("API.Work.getWorkViewState", param);
	}
	
	public int insertWorkViewState(HashMap<String, Object> param) {
		return insert("API.Work.insertWorkViewState", param);
	}
	
	public HashMap<String, Object> getContentPurchaseInfo(HashMap<String, Object> param) {
		return selectOne("API.Work.getContentPurchaseInfo", param);
	}
	
	public HashMap<String, Object> getContentInfo(HashMap<String, Object> param) {
		return selectOne("API.Work.getContentInfo", param);
	}
	
	public List<HashMap<String, Object>> getContentFileInfo(HashMap<String, Object> param) {
		return selectList("API.Work.getContentFileInfo", param);
	}
	
	public int getContentFileTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Work.getContentFileTotalCnt", param);
	}
	
	public String getEncKey(HashMap<String, Object> param) {
		return selectOne("API.Work.getEncKey", param);
	}
	
	public int getMemberCoin(HashMap<String, Object> param) {
		return selectOne("API.Work.getMemberCoin", param);
	}
	
	public List<HashMap<String, Object>> getWorkViewList(HashMap<String, Object> param) {
		return selectList("API.Work.getWorkViewList", param);
	}
	
	public int deleteMemberWorkView(HashMap<String, Object> param) {
		return update("API.Work.deleteMemberWorkView", param);
	}
	
}
