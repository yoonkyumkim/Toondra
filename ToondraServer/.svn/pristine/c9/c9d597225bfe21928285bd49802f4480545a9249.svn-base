package kr.co.toondra.web.community.controller;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.community.service.FAQService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/community/faq")
@Controller
public class FAQController extends BaseController {

	@Autowired
	private FAQService service;
	
	@RequestMapping("/faqListView")
	public String faqListView(Model model) {
		
		return "toondra/community/faq/faqList";
	}
	
	@RequestMapping("/faqList")
	public String faqList(@RequestPMap PMap pMap, Model model) {
		
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		
		model.addAllAttributes(service.getFAQList(pMap));
		
		return JSON_VIEW;
	}

	@RequestMapping("/faqDetail")
	public String faqDetail(@RequestPMap PMap pMap, Model model) {
		
		model.addAllAttributes(service.getFAQ(pMap));
		
		return "toondra/community/faq/faqDetail";
	}
	
	@RequestMapping("/insertFAQView")
	public String insertFAQView(@RequestPMap PMap pMap, Model model) throws Exception {
		
		return "toondra/community/faq/faq";
	}
	
	@RequestMapping("/insertFAQ")
	public String insertFAQ(@RequestPMap PMap pMap, Model model) throws Exception {

		model.addAttribute("result", service.insertFAQ(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updateFAQ")
	public String updateFAQ(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updateFAQ(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/deleteFAQ")
	public String deleteFAQ(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.deleteFAQ(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updateFAQPost")
	public String updateFAQPost(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updateFAQPost(pMap));
		
		return JSON_VIEW;
	}
}
