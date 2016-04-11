package kr.co.toondra.api.work.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.work.service.WorkService;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiWorkController")
public class WorkController extends BaseController {
	
	@Autowired
	private WorkService service;
	
	
	//작품 목록 조회
	@RequestMapping(value = "/work", method = RequestMethod.GET)
	public String getWorkList(@RequestParam HashMap<String, Object> param, Model model) throws Exception{
		
		model.addAttribute("result", service.getWorkList(param));
		
		return JSON_VIEW;
	}
	
	
	//작품 알림 설정
	@RequestMapping(value="/work/push", method = RequestMethod.PUT)
	public String updateWorkPush(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{

		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[]{"work_seq", "push_yn","login_key"});
		
		model.addAttribute("result", service.updateWorkPush(param));
		
		return JSON_VIEW;
	}
	
	
	//컨텐츠 목록 조회
	@RequestMapping(value="/work/{workSeq}", method = RequestMethod.GET)
	public String getContentList(@RequestParam HashMap<String, Object> param, @PathVariable int workSeq, Model model) throws Exception{
		
		param.put("work_seq", workSeq);
		
		model.addAttribute("result", service.getContentList(param));
		
		return JSON_VIEW;
	}
		
	
	//컨텐츠 상세보기
	@RequestMapping(value = "/work/content/{contentSeq}", method = RequestMethod.GET)
	public String getContentDetail(@RequestParam HashMap<String, Object> param, Model model, @PathVariable int contentSeq, HttpSession session) throws Exception {
		
		param.put("content_seq", contentSeq);
		
		CommonUtil.paramCheck(param, new String[]{"paid_yn", "content_seq", "device_id"});
		
		model.addAttribute("result", service.updateContentDetail(param, session));
		
		return JSON_VIEW;
	}
	

	//최근 본 작품 조회
	@RequestMapping(value = "/work/member/views", method = RequestMethod.GET)
	public String getMemberViewList(@RequestParam HashMap<String, Object> param, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[]{"login_key"});
		
		model.addAttribute("result", service.getMemberViewList(param));
		
		return JSON_VIEW;
	}
	
	//최근 본 작품 삭제
	@RequestMapping(value = "/work/member/views", method = RequestMethod.DELETE)
	public String deleteMemberView(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception {

		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[]{"work_seq","login_key"});
		
		model.addAttribute("result", service.deleteMemberWorkView(param));
		
		return JSON_VIEW;
	}	
	
}
