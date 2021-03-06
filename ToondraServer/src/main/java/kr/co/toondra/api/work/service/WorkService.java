package kr.co.toondra.api.work.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import kr.co.toondra.api.bean.Result;
import kr.co.toondra.api.work.dao.WorkDao;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.util.AESUtil;
import kr.co.toondra.common.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("apiWorkService")
public class WorkService {

	@Autowired
	private WorkDao dao;
	
	@Value("${url.local}")
	private String API_URL;
	
	public Result getWorkList(HashMap<String, Object> param) throws Exception{
		
		Result result = new Result();
		
		List<HashMap<String, Object>> workList = new ArrayList<HashMap<String, Object>>();
		
		int workTotalCnt = 0;
		
		workTotalCnt = dao.getWorkTotalCnt(param);
		
		workList = dao.getWorkList(param);
		
		if(workTotalCnt != workList.size()) {
			throw new LogicException("total cnt, workList cnt disagreement","408");
		}
		
		if(workList.size() > 0) {
			
			for(int i = 0; i < workList.size(); i++) {
				
				HashMap<String, Object> workMap = new HashMap<String, Object>();
				
				workMap = workList.get(i);
				
				String workSeq =  workMap.get("work_seq")+"";
				
				String thumbnailUrl = "";
				
				if(workSeq != null && !workSeq.equals("")) {
				
					thumbnailUrl = API_URL + "/api/image/thumbnail/" + workSeq;
					
					workList.get(i).put("thumbnail_img_url", thumbnailUrl);
				}
			}
		}
		
		result.putObject("total_cnt", workTotalCnt);
		result.putObject("work_list", workList);
		
		
		return result;
	}
	
	
	public Result getContentList(HashMap<String, Object> param) throws Exception{
		
		Result result = new Result();
		
		HashMap<String, Object> workInfo = new HashMap<String, Object>();

		List<HashMap<String, Object>> contentList = new ArrayList<HashMap<String, Object>>();
		
		workInfo =  dao.getWorkInfo(param);

		int contentTotalCnt = 0;
		
		contentTotalCnt = dao.getContentTotalCnt(param);
		
		contentList = dao.getContentList(param);
		
		
		if(workInfo == null || workInfo.isEmpty() || workInfo.get("work_seq") == null) {
			throw new LogicException("[Query] not found data { work info }","402");
		}
		
		if(contentTotalCnt != contentList.size()) {
			throw new LogicException("total cnt, contentList cnt disagreement","408");
		}
		
		//작품
		workInfo.put("work_thumnail_img_url", API_URL + "/api/image/thumbnail/" + param.get("work_seq"));
		
		
		workInfo.put("total_cnt" , contentTotalCnt);
				
		//컨텐츠 
		if(contentList.size() > 0) {
			for(int i = 0; i < contentList.size(); i++) {
				
				HashMap<String, Object> contentMap = new HashMap<String, Object>();
				
				contentMap = contentList.get(i);

				String contentSeq =  contentMap.get("content_seq")+"";
				
				String fileName = (String)contentMap.get("thumbnail_img_url");
				
				String thumbnailUrl = "";
				
				String workSeq = param.get("work_seq")+"";
				
					
				if(contentSeq != null && !contentSeq.equals("") && fileName != null && !fileName.equals("")) {
					thumbnailUrl = API_URL + "/api/image/content/thumbnail/" + contentSeq;
				}else {
					thumbnailUrl = API_URL + "/api/image/thumbnail/" + workSeq;
				}
					
				contentList.get(i).put("thumbnail_img_url", thumbnailUrl);
			}
		}
		
		result.setData(workInfo);
		result.putObject("content_list", contentList);
		
		return result;
	}
	
	
	public Result updateWorkPush(HashMap<String, Object> param) throws Exception{
		
		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq(param);
		
		if(memberSeq == null || memberSeq.equals("") ) {
			throw new LogicException("[Query] not found data {member_seq}","402");
		}
		
		param.put("member_seq", memberSeq);
		
		if(dao.getWorkViewState(param) > 0){
			
			if(dao.getWorkPushState(param) > 0 ) {
				
				if(dao.updateWorkPushState(param) != 1) {
					throw new LogicException("[Query] update fail { push_yn }","403");
				}
				
			}else {
				
				result.setResp_code("410");
				
				result.setResp_msg("Not found view info");
			}
		}
		
		return result;
	}
	
	
	
	public Result updateContentDetail(HashMap<String, Object> param, HttpSession session) throws Exception {
		
		Result result = new Result();
		
		//유료 여부
		String paidState = (String)param.get("paid_yn");
		
		//AES 키를 암호화 할 키
		String encKey = "";
		
		String memberSeq ="";
		
		String loginKey = (String)session.getAttribute("login_key");

		if(loginKey != null && !loginKey.equals("")){
			
			param.put("login_key", loginKey);
			
			memberSeq = dao.getMemberSeq(param);
			
			if(memberSeq == null || memberSeq.equals("") ) {
				throw new LogicException("[Query] not found data { member_seq }","402");
			}
			
			param.put("member_seq", memberSeq);
		}
		
		int contentFileTotalCnt = 0;
		
		//컨텐츠 정보
		HashMap<String, Object> contentInfo = new HashMap<String, Object>();
		
		//컨텐츠 파일 정보
		List<HashMap<String, Object>> contentFileInfo = new ArrayList<HashMap<String,Object>>();
		
		
		encKey = dao.getEncKey(param); 
		
		contentInfo = dao.getContentInfo(param);
		
		contentFileInfo = dao.getContentFileInfo(param);
		
		contentFileTotalCnt = dao.getContentFileTotalCnt(param);
	
		if(contentInfo == null || contentInfo.get("content_seq") == null) {
			throw new LogicException("[Query] not found data { content info }","402");
		}
		
		if(encKey == null || encKey.equals("")) {
			throw new LogicException("[Query] not found data { enc_key }","402");
		}
		
		if(contentFileTotalCnt != contentFileInfo.size()) {
			throw new LogicException("total cnt, content file list cnt disagreement","408");
		}
		
		
		//AES키를 암호화키로 암호화
		SecretKey encriptKey = new SecretKeySpec(Base64.decode(encKey), "AES");

		String contentEncKey = (String)contentInfo.get("content_enc_key");
		
		String encFileAesKey = AESUtil.randomKeyEncrypt(contentEncKey, encriptKey);
		
		contentInfo.put("content_enc_key", encFileAesKey);

		for(int i = 0; i < contentFileInfo.size(); i++) {
			
			HashMap<String, Object> contentFileMap = contentFileInfo.get(i);
			
			String imgName = (String)contentFileMap.get("content_img_url");
			
			String fileUrl = "";
			
			if(imgName != null && !imgName.equals("")) {
			
				fileUrl = API_URL + "/api/image/content/"+ contentInfo.get("work_seq") +"/" +contentInfo.get("content_seq") +"/"+ imgName;
				
				contentFileInfo.get(i).put("content_img_url", fileUrl);
			}
		}
		
		//유료 컨텐츠
		if(paidState.equals("Y") && !memberSeq.equals("")) {	
			
			//컨텐츠 구매 정보
			HashMap<String, Object> contentPurchaseInfo = new HashMap<String, Object>();
			
			contentPurchaseInfo = dao.getContentPurchaseInfo(param);
			
			if(contentPurchaseInfo == null || contentPurchaseInfo.get("purchase_seq") == null) {
				
				int memberCoin = dao.getMemberCoin(param);
				
				result.putObject("retention_coin", memberCoin);
				result.setResp_code("409");
				result.setResp_msg("Not found content purchase info");
				
				return result;
			}
			
		}

		//최근 본 작품에 추가
		if(param.get("member_seq") != null) {
			param.put("work_seq", contentInfo.get("work_seq"));
			if(dao.insertWorkViewState(param) != 1) {
				throw new LogicException("[Query] insert fail ","403");
			}
		}
		
		
		contentInfo.put("total_cnt", contentFileTotalCnt);
		result.setData(contentInfo);
		result.putObject("content_file_list", contentFileInfo);
		
		
		return result;
	}
	
	
	
	public Result getMemberViewList(HashMap<String, Object> param) throws Exception {
		
		Result result = new Result();
		
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		
		String memberSeq = dao.getMemberSeq(param);
		
		if(memberSeq == null || memberSeq.equals("") ) {
			throw new LogicException("[Query] not found data { member_seq }","402");
		}
		
		param.put("member_seq", memberSeq);
		
		List<HashMap<String,Object>> workViewList = new ArrayList<HashMap<String,Object>>();
		
		workViewList = dao.getWorkViewList(param);
		
		for(int i=0; i<workViewList.size(); i++){
			
			HashMap<String, Object> workViewInfo = workViewList.get(i);
			
			String workSeq =  workViewInfo.get("work_seq")+"";
			
			String thumbnailUrl = "";
			
			if(workSeq != null && !workSeq.equals("")) {
				thumbnailUrl = API_URL + "/api/image/thumbnail/" + workSeq;
				workViewList.get(i).put("thumbnail_img_url", thumbnailUrl);
			}
		}
		
		dataMap.put("work_list", workViewList);
		dataMap.put("total_cnt", workViewList.size());
		
		result.setData(dataMap);
		
		return result;
	}
	
	
	
	public Result deleteMemberWorkView(HashMap<String, Object> param) throws Exception {
		
		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq(param);

		if(memberSeq == null || memberSeq.equals("") ) {
			throw new LogicException("[Query] not found data { member_seq }","402");
		}
		
		param.put("member_seq", memberSeq);
		
		if(dao.deleteMemberWorkView(param) == 0) {
			throw new LogicException("[Query] delete fail","403"); 
		}
		
		return result;
	
	}
	
	
}
