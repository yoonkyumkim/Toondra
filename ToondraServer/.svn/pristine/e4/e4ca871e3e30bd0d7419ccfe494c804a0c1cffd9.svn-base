package kr.co.toondra.api.purchase.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.api.bean.Result;
import kr.co.toondra.api.purchase.dao.PurchaseDao;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.exception.RuntimeLogicException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service("apiPurchaseService")
public class PurchaseService {
	
	@Autowired
	private PurchaseDao dao;
	
	@Value("${url.local}")
	private String API_URL;
	
	public Result insertPurchaseContent(HashMap<String, Object> param) throws Exception {
		
		HashMap<String, Object> memberInfo = new HashMap<String, Object>();
		
		HashMap<String, Object> contentInfo = new HashMap<String, Object>();

		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq((String)param.get("login_key"));
		
		if(memberSeq == null || memberSeq.equals("")){
			throw new LogicException("[Query] not found data {member_seq}", "402");
		}
		
		param.put("member_seq", memberSeq);
		
		memberInfo = dao.getMemberInfo(param);
		
		if(memberInfo == null || memberInfo.get("member_seq") == null){
			throw new LogicException("[Query] not found data { member info }", "402");
		}
		
		contentInfo = dao.getContentInfo(param);
		
		if(contentInfo == null || contentInfo.get("content_seq") == null) {
			throw new LogicException("[Query] not found data { content_seq }", "402");
		}

		param.put("purchase_coin", contentInfo.get("coin"));
	
		if(dao.insertContentPurcharse(param) != 1 ) {
			throw new LogicException("[Query] insert fail { purchase content }", "403");
		}
		
		//member 보유 코인
		int retentionCoin = ((Long) memberInfo.get("retention_coin")).intValue();
		//content 구매 코인
		int contentPurchaseCoin = ((Long) contentInfo.get("coin")).intValue();
		
		if(retentionCoin >= contentPurchaseCoin) {
			
			retentionCoin = retentionCoin - contentPurchaseCoin;
			param.put("retention_coin", retentionCoin);
			
			if(dao.updateMemberInfo(param) != 1) {
				throw new LogicException("[Query] update fail { member info }", "403");
			}
			
		}else {
			throw new RuntimeLogicException("underfinanced retention_coin", "411");
		}
		
		return result;
	}
	
	
	public Result deletePurchaseContent(HashMap<String, Object> param) throws Exception{
		
		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq((String)param.get("login_key"));

		if(memberSeq == null || memberSeq.equals("")) {
			throw new LogicException("[Query] not found data {member_seq}", "402");
		}
		
		param.put("member_seq", memberSeq);
		
		if(dao.deletePurchaseContent(param) != 1) {
			throw new LogicException("[Query] delete fail {purchase content}", "403");
		}
		
		return result;
	}
	
	public Result getPurchaseContentList(HashMap<String, Object> param) throws Exception {
		
		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq((String)param.get("login_key"));
		
		HashMap<String, Object> dataMap = new HashMap<String, Object>();

		List<HashMap<String, Object>> purchaseContentList = new ArrayList<HashMap<String,Object>>();
		
		//구매 컨텐츠 총 개수
		int totalCnt = 0;
		
		if(memberSeq == null || memberSeq.equals("")){
			throw new LogicException("[Query] not found data {member_seq}", "402");
		}
		
		param.put("member_seq", memberSeq);
		
		totalCnt = dao.getTotalCnt(param);
		
		purchaseContentList = dao.getPurchaseContentList(param);
		
		if(totalCnt != purchaseContentList.size()) {
			throw new LogicException("total cnt, Purchase Content List cnt disagreement","408");
		}
		
		
		if(purchaseContentList.size() > 0) {
			for(int i = 0; i < purchaseContentList.size(); i++) {
				
				HashMap<String, Object> contentMap = new HashMap<String, Object>();
				
				contentMap = purchaseContentList.get(i);

				String contentSeq =  contentMap.get("content_seq")+"";
				
				String fileName = (String)contentMap.get("thumbnail_img_url");
				
				String thumbnailUrl = "";
				
				String workSeq = contentMap.get("work_seq")+"";
				
					
				if(contentSeq != null && !contentSeq.equals("") && fileName != null && !fileName.equals("")) {
					thumbnailUrl = API_URL + "/api/image/content/thumbnail/" + contentSeq;
				}else {
					thumbnailUrl = API_URL + "/api/image/thumbnail/" + workSeq;
				}
					
				purchaseContentList.get(i).put("thumbnail_img_url", thumbnailUrl);
			}
		}
		
		
		dataMap.put("total_cnt", totalCnt);
		dataMap.put("purchase_list", purchaseContentList);
		
		result.setData(dataMap);
		
		
		
		
		return result;
	}
	
	
}
