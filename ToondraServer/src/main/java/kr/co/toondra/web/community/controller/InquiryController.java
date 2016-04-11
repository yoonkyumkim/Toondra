package kr.co.toondra.web.community.controller;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.community.service.InquiryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/community/inquiry")
@Controller
public class InquiryController extends BaseController {

	@Autowired
	private InquiryService service;

	@RequestMapping("/inquiryListView")
	public String inquiryListView(Model model) {
		
		model.addAttribute("codeList", service.getInquiryCategory());
		
		return "toondra/community/inquiry/inquiryList";
	}

	@RequestMapping("/inquiryList")
	public String inquiryList(@RequestPMap PMap pMap, Model model) {
		
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		
		model.addAllAttributes(service.getInquiryList(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/inquiryDetail")
	public String inquiryDetail(@RequestPMap PMap pMap, Model model) {
		
		model.addAllAttributes(service.getInquiry(pMap));
		
		return "toondra/community/inquiry/inquiryDetail";
	}

	@RequestMapping("/answerInquiry")
	public String answerInquiry(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.answerInquiry(pMap));
		
		return JSON_VIEW;
	}
}
