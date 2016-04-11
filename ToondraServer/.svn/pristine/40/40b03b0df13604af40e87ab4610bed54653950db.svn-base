package kr.co.toondra.api.community.controller;

import java.util.HashMap;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.community.service.NoticeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiNoticeController")
public class NoticeController extends BaseController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String noticeListView(@RequestParam HashMap<String, Object> param, Model model) {
		model.addAttribute("result", service.getNoticeList(param));
		
		return JSON_VIEW;
	}
}
