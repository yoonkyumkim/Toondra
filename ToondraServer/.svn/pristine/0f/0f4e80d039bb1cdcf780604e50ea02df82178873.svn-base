package kr.co.toondra.web.community.controller;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.community.service.PushService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/community/push")
@Controller
public class PushController extends BaseController {

	@Autowired
	private PushService service;
	
	@RequestMapping("/pushListView")
	public String pushListView(Model model) {
		return "toondra/community/push/pushList";
	}
	
	@RequestMapping("/pushList")
	public String pushList(@RequestPMap PMap pMap, Model model) {
		
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		
		model.addAllAttributes(service.getPushList(pMap));
		
		return JSON_VIEW;
	}

	@RequestMapping("/pushDetail")
	public String pushDetail(@RequestPMap PMap pMap, Model model) {
		
		model.addAllAttributes(service.getPush(pMap));
		
		return "toondra/community/push/pushDetail";
	}
	
	@RequestMapping("/insertPushView")
	public String insertPushView(@RequestPMap PMap pMap, Model model) throws Exception {
		
		return "toondra/community/push/push";
	}
	
	@RequestMapping("/insertPush")
	public String insertPush(@RequestPMap PMap pMap, Model model) throws Exception {

		model.addAttribute("result", service.insertPush(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updatePush")
	public String updatePush(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updatePush(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/deletePush")
	public String deletePush(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.deletePush(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/updatePushPost")
	public String updatePushPost(@RequestPMap PMap pMap, Model model) throws Exception {
		
		model.addAttribute("result", service.updatePushPost(pMap));
		
		return JSON_VIEW;
	}
}
