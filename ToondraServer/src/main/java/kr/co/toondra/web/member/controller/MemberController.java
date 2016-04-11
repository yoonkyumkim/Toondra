package kr.co.toondra.web.member.controller;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/member/")
@Controller
public class MemberController extends BaseController{

	@Autowired
	private MemberService service;
	
	@RequestMapping("/memberListView")
	public String getMemberListView(Model model) {
		
		return "toondra/member/memberList";
	}
	
	@RequestMapping("/memberList")
	public String getMemberList(@RequestPMap PMap pMap, Model model) {

		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		
		model.addAllAttributes(service.getMemberList(pMap));
		
		return "jacksonView";
	}
	
}
