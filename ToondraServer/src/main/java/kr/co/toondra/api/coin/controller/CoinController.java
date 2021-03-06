package kr.co.toondra.api.coin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.co.toondra.api.coin.service.CoinService;
import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiCoinController")
public class CoinController extends BaseController {

	
	@Autowired
	private CoinService service;
	
	//보유 코인 조회
	@RequestMapping(value = "/coin/member", method = RequestMethod.GET)
	public String getCoinMember(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});

		model.addAttribute("result", service.getCoinMember(param));

		return JSON_VIEW;
	}
	
	//코인 충전 상품 목록 조회
	@RequestMapping(value = "/coin/product" , method=RequestMethod.GET)
	public String getCoinProduct(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});		
		
		model.addAttribute("result", service.getCoinProduct(param));
		
		return JSON_VIEW;
	}
	
	//충전 내역 조회
	@RequestMapping(value = "/coin/member/purchase/history" , method=RequestMethod.GET)
	public String getCoinPurchaseHistory(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});		
		
		model.addAttribute("result", service.getCoinPurchaseHistory(param));
		
		return JSON_VIEW;
	}
	
	//코인 구매 요청
	@RequestMapping(value = "/coin/purchase" , method=RequestMethod.POST)
	public String insertCoinPurchaseReq(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key","product_id"});		
		
		model.addAttribute("result", service.insertCoinPurchaseReq(param));
		
		return JSON_VIEW;
	}
	
	//코인 구매 완료
	@RequestMapping(value = "/coin/purchase" , method=RequestMethod.PUT)
	public String updateCoinPurchaseComplete(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key", "purchase_seq", "order_id", "purchase_date", "purchase_state"});		
		
		model.addAttribute("result", service.updateCoinPurchaseComplete(param));
		
		return JSON_VIEW;
	}
	
	//코인 사용 내역 조회
	@RequestMapping(value = "/coin/member/used/history" , method=RequestMethod.GET)
	public String getCoinUsedHistory(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});		
		
		model.addAttribute("result", service.getCoinUsedHistory(param));
		
		return JSON_VIEW;
	}
		
}
