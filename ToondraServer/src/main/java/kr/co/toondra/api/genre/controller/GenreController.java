package kr.co.toondra.api.genre.controller;

import java.util.HashMap;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.genre.service.GenreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiGenreController")
public class GenreController extends BaseController {
	
	@Autowired
	private GenreService service;
	
	//장르 목록 조회
	@RequestMapping(value = "/genre", method = RequestMethod.GET)
	public String getGenreList(@RequestParam HashMap<String, Object> param, Model model) throws Exception{
		
		model.addAttribute("result", service.getGenreList(param));
		
		return JSON_VIEW;
	}
	
}
