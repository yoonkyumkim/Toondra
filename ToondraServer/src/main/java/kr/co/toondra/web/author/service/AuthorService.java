package kr.co.toondra.web.author.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.util.SessionUtil;
import kr.co.toondra.web.author.dao.AuthorDao;

@Service
public class AuthorService {
	
	@Autowired
	AuthorDao dao = new AuthorDao();
	
	public PMap authorList(PMap pMap){
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		//전체 카운트
		int totalcnt = dao.getAuthorTotalCnt(pMap);
		pMap.put("iTotalRecords", totalcnt);
		pMap.put("iTotalDisplayRecords", totalcnt);
		List<HashMap<String, Object>> authorList = new ArrayList<HashMap<String, Object>>();
		if (totalcnt > 0) {
			authorList = dao.getAuthorList(pMap);
		}
		pMap.put("aaData", authorList);
		
		return pMap;
	}
	
	public PMap insertAuthor(PMap pMap) {
		
		SessionUtil util = new SessionUtil(pMap.getRequest());
		pMap.put("reg_manager_seq",util.getSessionValue("s_manager_seq"));
		dao.createAuthor(pMap);
		String seq = dao.getSeq().get("author_seq").toString();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("author_seq", seq);
		int addrCnt = pMap.getInt("addr_cnt");
		int phoneCnt = pMap.getInt("phone_cnt");
		for(int i = 1; i<=addrCnt; i++){
			map.put("zip_code", pMap.get("zip_code" + i));
			map.put("addr", pMap.get("addr" + i));
			map.put("detail_addr", pMap.get("detail_addr" + i));
			dao.createAddr(map);
		}
		for(int i = 1; i<=phoneCnt; i++) {
			map.put("phone_num", pMap.get("phone_num" + i));
			dao.createPhone(map);
		}
		
		pMap.put("result", "success");
		
		return pMap;
	}
	
	public PMap idCheck(PMap pMap) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		if(dao.idCheck(pMap) != null) {
			map.put("result", "true");
		} else {
			map.put("result", "false");
		}
		pMap.put("jsonData", map);
		
		return pMap;
	}

	public PMap getAuthor(PMap pMap) {
		
		HashMap<String, Object> authorInfo = new HashMap<String, Object>();
		authorInfo = dao.getAuthor(pMap);
		List<HashMap<String,Object>> addrList = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> phoneList = new ArrayList<HashMap<String,Object>>();
		addrList = dao.getAddr(pMap);
		phoneList = dao.getPhone(pMap);
		pMap.put("authorInfo", authorInfo);
		pMap.put("addrList", addrList);
		pMap.put("phoneList", phoneList);
		
		return pMap;
	}

	public PMap updateAuthor(PMap pMap) {
		String delAddrList[] = pMap.getRequest().getParameterValues("del_addr_list");
		String delPhoneList[] = pMap.getRequest().getParameterValues("del_phone_list");
		String updateAddrList[] = pMap.getRequest().getParameterValues("addr_seq");
		String updatePhoneList[] = pMap.getRequest().getParameterValues("phone_num_seq");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String position = "";
		//주소
		for(int i = 0; i < delAddrList.length; i++) {
			if(!delAddrList[i].equals("")) {
				map.put("addr_seq", delAddrList[i]);
				dao.delAddr(map);
			}
		}
		map.clear();
		if(updateAddrList != null){
			for(int i = 0; i < updateAddrList.length; i++) {
				position = updateAddrList[i];
				map.put("addr_seq", position);
				map.put("zip_code", pMap.get("update_zip_code" + position));
				map.put("addr", pMap.get("update_addr" + position));
				map.put("detail_addr", pMap.get("update_detail_addr" + position));
				dao.updateAddr(map);
			}
		}
		int addrCnt = pMap.getInt("addr_cnt");
		map.put("author_seq", pMap.get("author_seq"));
		if(addrCnt != 0){
			for(int i = 1; i<=addrCnt; i++){
				map.put("zip_code", pMap.get("zip_code" + i));
				map.put("addr", pMap.get("addr" + i));
				map.put("detail_addr", pMap.get("detail_addr" + i));
				dao.createAddr(map);
			}
		}
		//연락처 
		for(int i = 0; i < delPhoneList.length; i++) {
			if(!delPhoneList[i].equals("")) {
				map.put("phone_num_seq", delPhoneList[i]);
				dao.delPhone(map);
			}
		}
		map.clear();
		if(updatePhoneList != null){
			for(int i = 0; i < updatePhoneList.length; i++) {
				position = updatePhoneList[i];
				map.put("phone_num_seq", position);
				map.put("phone_num", pMap.get("update_phone_num" + position));
				dao.updatePhone(map);
			}
		}
		map.put("author_seq", pMap.get("author_seq"));
		int phoneCnt = pMap.getInt("phone_cnt");
		if(phoneCnt != 0){
			for(int i = 1; i<=phoneCnt; i++) {
				map.put("phone_num", pMap.get("phone_num" + i));
				dao.createPhone(map);
			}
		}
		pMap.put("upt_manager_seq", pMap.getRequest().getSession().getAttribute("s_manager_seq"));
		dao.updateAuthor(pMap);
		pMap.put("result", "success");
		
		return pMap;
	}

	public PMap deleteAuthor(PMap pMap) {
		String delList[] = pMap.getRequest().getParameterValues("del_list");
		
		for(int i = 0; i<delList.length; i++){
			pMap.put("author_seq", delList[i]);
			if(dao.getWork(pMap) > 0) {
				pMap.put("result", "fail");
				return pMap;
			} else {
				dao.deleteAuthor(pMap);
			}
		}
		pMap.put("result", "success");
		return pMap;
	}

}
