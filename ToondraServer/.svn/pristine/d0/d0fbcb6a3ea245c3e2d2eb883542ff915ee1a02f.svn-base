package kr.co.toondra.api.purchase.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.purchase.service.PurchaseService;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiPurchaseController")
public class PurchaseController extends BaseController {

	
	@Autowired
	private PurchaseService service;
	
	//컨텐츠 구매
	@RequestMapping(value = "/purchase/content", method = RequestMethod.POST)
	public String insertPurchaseContent(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key","content_seq"});

		model.addAttribute("result", service.insertPurchaseContent(param));

		return JSON_VIEW;
	}
	
	
	//구매 컨텐츠 삭제
	@RequestMapping(value = "/purchase/content", method = RequestMethod.DELETE)
	public String deletePurchaseContent(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key","purchase_seq"});

		model.addAttribute("result", service.deletePurchaseContent(param));

		return JSON_VIEW;
	}
	
	//구매 컨텐츠 목록 조회
	@RequestMapping(value = "/purchase/content", method = RequestMethod.GET)
	public String getPurchaseContentList(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});

		model.addAttribute("result", service.getPurchaseContentList(param));

		return JSON_VIEW;
	}	
	
}
