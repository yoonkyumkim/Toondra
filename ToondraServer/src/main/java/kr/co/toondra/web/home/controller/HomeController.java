package kr.co.toondra.web.home.controller;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.base.controller.BaseController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController extends BaseController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request, Model model) throws Exception{
		
		//logger.debug("\t\t UUID : " + UUID.randomUUID().toString());

		if(request.getSession().getAttribute("s_manager_seq") != null){
			return "redirect:/admin/work/workListView";
		}
		return "redirect:/admin/login/loginView";
	}

	
	@RequestMapping(value = "/admin")
	public String admin(HttpServletRequest request, Model model) throws Exception {
		
		if(request.getSession().getAttribute("s_manager_seq") != null){
			return "redirect:/admin/work/workListView";
		}
		return "redirect:/admin/login/loginView";
	}
	
}
