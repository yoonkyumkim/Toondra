package kr.co.toondra.web.service.controller;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;
import kr.co.toondra.web.service.service.GenreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/service")
@Controller
public class GenreController extends BaseController {
	
	@Autowired
	private GenreService service;
	
	@RequestMapping("/genreListView")
	public String genre(Model model) {
		
		List<HashMap<String, Object>> genreList = service.getGenreList();
		model.addAttribute("genreList", genreList);
		
		return "toondra/service/genre/genreList";
	}

	@RequestMapping("/updateGenre")
	public String updateGenre(@RequestPMap PMap pMap, Model model) throws Exception {

		model.addAttribute("result", service.updateGenre(pMap));
		
		return JSON_VIEW;
	}
}
