package kr.co.toondra.api.sample.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.sample.service.ApiSampleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/sample")
public class ApiSampleController extends BaseController{
	
	
	@Autowired
	ApiSampleService service;
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public @ResponseBody String apiTest(@RequestParam HashMap<String, Object> param, HttpServletRequest request) throws Exception {
		
		
		System.out.println("param :: " + param);
		
		System.out.println("param 2 :: " + request.getParameter("name"));
		
		return JSON_VIEW;
	}
	@ResponseBody
	@RequestMapping(value = "/testAjax", method = RequestMethod.GET )
	public String testAjax(HttpServletRequest request, Model model) throws IOException {
				
		System.out.println("aa : " + request.getParameter("aa"));
		System.out.println("bb : " + request.getParameter("bb"));
		System.out.println("cc : " + request.getParameter("cc"));
		
		
		System.out.println("testAjax");
		
		model.addAttribute("data", "1234");
		return "jacksonView";
	}
}
