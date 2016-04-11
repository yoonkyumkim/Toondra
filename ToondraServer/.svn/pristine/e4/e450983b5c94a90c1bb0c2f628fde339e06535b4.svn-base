package kr.co.toondra.web.community.controller;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.community.service.NoticeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/community/notice")
@Controller
public class NoticeController extends BaseController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeListView")
	public String noticeListView(Model model) {
		return "toondra/community/notice/noticeList";
	}
	
	@RequestMapping("/noticeList")
	public String noticeList(@RequestPMap PMap pMap, Model model) {
		
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		
		model.addAllAttributes(service.getNoticeList(pMap));
		
		return JSON_VIEW;
	}

	@RequestMapping("/noticeDetail")
	public String noticeDetail(@RequestPMap PMap pMap, Model model) {
		
		model.addAllAttributes(service.getNotice(pMap));
		
		return "toondra/community/notice/noticeDetail";
	}
	
	@RequestMapping("/insertNoticeView")
	public String insertNoticeView(@RequestPMap PMap pMap, Model model) throws Exception {
		
		return "toondra/community/notice/notice";
	}
	
	@RequestMapping("/insertNotice")
	public String insertNotice(@RequestPMap PMap pMap, Model model) throws Exception {

		model.addAttribute("result", service.insertNotice(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updateNotice")
	public String updateNotice(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updateNotice(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/deleteNotice")
	public String deleteNotice(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.deleteNotice(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updateNoticePost")
	public String updateNoticePost(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updateNoticePost(pMap));
		
		return JSON_VIEW;
	}
}
