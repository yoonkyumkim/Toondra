package kr.co.toondra.api.community.service;

import java.util.HashMap;

import kr.co.toondra.api.bean.Result;
import kr.co.toondra.api.community.dao.InquiryDao;
import kr.co.toondra.common.exception.LogicException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("apiInquiryService")
public class InquiryService {

	@Autowired
	private InquiryDao dao;
	
	
	public Result insertInquiry(HashMap<String, Object> param) throws Exception {
		
		Result result = new Result();
		
		String memberSeq = dao.getMemberSeq((String)param.get("login_key"));
		
		if(memberSeq == null || memberSeq.equals("")) {
			throw new LogicException("[Query] not found data {member_seq}", "402");
		}
		
		param.put("member_seq", memberSeq);
		
		dao.insertInquiry(param);
		
		return result;
		
	}
	
	
}
