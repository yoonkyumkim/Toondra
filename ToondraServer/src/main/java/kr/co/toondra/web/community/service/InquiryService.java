package kr.co.toondra.web.community.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.util.MailSender;
import kr.co.toondra.web.community.dao.InquiryDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class InquiryService {

	@Value("${inquiry_title}")
	private String INQUIRY_TITLE;
	
	@Autowired
	private InquiryDao dao;
	
	@Autowired
	MailSender sender = new MailSender();

	public List<HashMap<String, Object>> getInquiryCategory() {
		return dao.getInquiryCategory();
	}
	
	public HashMap<String, Object> getInquiryList(PMap pMap) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int inquiryListCount = dao.getInquiryListCount(pMap);
		List<HashMap<String, Object>> inquiryList = dao.getInquiryList(pMap);
		
		result.put("iTotalRecords", inquiryListCount);
		result.put("iTotalDisplayRecords", inquiryListCount);		
		result.put("aaData", inquiryList);
		
		return result;
	}

	public HashMap<String, Object> getInquiry(PMap pMap) {
		return dao.getInquiry(pMap);
	}
	
	public boolean answerInquiry(PMap pMap) throws Exception {
		
		HashMap<String, Object> inquiry = dao.getInquiry(pMap);
		
		
		sender.sendSmtpGMail((String)inquiry.get("email"), INQUIRY_TITLE, pMap.getString("answer"));
		
		HttpSession session = pMap.getRequest().getSession();
		pMap.put("managerSeq", session.getAttribute("s_manager_seq"));
		
		dao.answerInquiry(pMap);
		
		return true;
	}
	
}
