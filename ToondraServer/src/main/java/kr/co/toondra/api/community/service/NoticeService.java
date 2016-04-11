package kr.co.toondra.api.community.service;

import java.util.HashMap;

import kr.co.toondra.api.bean.Result;
import kr.co.toondra.api.community.dao.NoticeDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("apiNoticeService")
public class NoticeService {

	@Autowired
	private NoticeDao dao;

	public Result getNoticeList(HashMap<String, Object> param) {

		Result result = new Result();
		result.putObject("total_cnt", dao.getNoticeListCount(param));
		result.putObject("notice_list", dao.getNoticeList(param));
		
		return result;
	}

}
