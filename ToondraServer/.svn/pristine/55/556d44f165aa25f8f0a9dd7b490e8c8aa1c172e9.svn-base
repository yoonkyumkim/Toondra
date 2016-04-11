package kr.co.toondra.api.community.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.community.service.InquiryService;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiInquiryController")
public class InquiryController extends BaseController{
	
	
	@Autowired
	private InquiryService service;
	
	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	public String insertInquiry (@RequestParam HashMap<String, Object> param, HttpServletRequest request, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"content", "category_code_seq", "login_key"});
		
		int category_code_seq = Integer.parseInt((String)param.get("category_code_seq"));
			
		switch(category_code_seq) {
			case 2 :
			case 3 :
			case 4 :
			case 5 :
				break;
			default : 
				throw new LogicException("Does not apply right format", "401");
		}
		
		model.addAttribute("result", service.insertInquiry(param));
		
		return JSON_VIEW;
	}
	
	
}
