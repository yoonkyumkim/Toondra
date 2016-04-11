package kr.co.toondra.api.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.member.service.MemberService;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiMemberController")
public class MemberController extends BaseController {

	
	@Autowired
	private MemberService service;
	
	
	//회원가입
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String memberJoin(@RequestParam HashMap<String, Object> param, Model model) throws Exception{

		CommonUtil.paramCheck(param, new String[] {"email", "password","device_seq"});

		model.addAttribute("result", service.insertMember(param));

		return JSON_VIEW;
	}
	
	
	//회원 인증
	@RequestMapping(value = "/member/confirm", method = RequestMethod.GET)
	public String memberConfirm(@RequestParam HashMap<String, Object> param, Model model) throws Exception{
		
		CommonUtil.paramCheck(param, new String[] {"cert_key"});
		
		String result = "성공";
		
		if(service.updateMemberConfirm(param) == 0){
			result = "실패";
		}
		
		model.addAttribute("result", result);
		
		return "toondra_api/member/memberConfirm";
	}
	
	
	//로그인
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String memberLogin(@RequestParam HashMap<String, Object> param, Model model) throws Exception{

		CommonUtil.paramCheck(param, new String[] {"email", "password", "device_seq"});
				
		model.addAttribute("result", service.memberLogin(param));

		return JSON_VIEW;
	}
	
	//로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.PUT)
	public String memberLogout(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"login_key"});
		
		model.addAttribute("result", service.updateMemberLogout(param));

		return JSON_VIEW;
	}
	
	
	//비밀번호 변경
	@RequestMapping(value = "/member/pw/change", method = RequestMethod.PUT)
	public String memberPwChange(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"now_password","new_password", "login_key"});
		
		model.addAttribute("result", service.updateMemberPwChange(param));

		return JSON_VIEW;
	}
	
	
	//비밀번호 찾기
	@RequestMapping(value = "/member/pw/find", method = RequestMethod.POST)
	public String memberFindPw(@RequestParam HashMap<String, Object> param, Model model) throws Exception{

		CommonUtil.paramCheck(param, new String[] {"email"});
		
		String email = (String)param.get("email");
		
		if(!CommonUtil.isEmail(email)) {
			throw new LogicException("Does not apply right format", "401");
		}
		
		model.addAttribute("result", service.memberFindPw(param));

		return JSON_VIEW;
	}

	
	//PUSH 여부 설정
	@RequestMapping(value="/member/push", method = RequestMethod.PUT)
	public String memberPush(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception{
		
		param.put("login_key", session.getAttribute("login_key"));
		
		CommonUtil.paramCheck(param, new String[] {"push_yn", "login_key"});
		
		model.addAttribute("result", service.memberPush(param));
		
		return JSON_VIEW;
	}
	
	
}
