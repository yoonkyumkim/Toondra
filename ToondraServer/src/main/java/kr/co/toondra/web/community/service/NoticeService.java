package kr.co.toondra.web.community.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.community.dao.NoticeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;

	public HashMap<String, Object> getNoticeList(PMap pMap) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int noticeListCount = dao.getNoticeListCount(pMap);
		List<HashMap<String, Object>> noticeList = dao.getNoticeList(pMap);
		
		result.put("iTotalRecords", noticeListCount);
		result.put("iTotalDisplayRecords", noticeListCount);		
		result.put("aaData", noticeList);
		
		return result;
	}

	public HashMap<String, Object> getNotice(PMap pMap) {
		return dao.getNotice(pMap);
	}
	
	public boolean insertNotice(PMap pMap) throws Exception {
		
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		dao.insertNotice(pMap);
		
		return true;
	}

	public boolean updateNotice(PMap pMap) throws Exception {

		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		dao.updateNotice(pMap);
		
		return true;
	}

	public boolean deleteNotice(PMap pMap) throws Exception {
		
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));

		List<String> noticeSeqList = Arrays.asList(pMap.getString("noticeSeqStr").split("\\|"));
		pMap.put("list", noticeSeqList);
		dao.deleteNotice(pMap);
		
		return true;
	}

	public boolean updateNoticePost(PMap pMap) {
		
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		
		List<String> noticeSeqList = Arrays.asList(pMap.getString("noticeSeqStr").split("\\|"));
		pMap.put("list", noticeSeqList);
		dao.updateNoticePost(pMap);
		return true;
	}
	
}
