package kr.co.toondra.web.author.controller;


import javax.servlet.http.HttpServletRequest;



import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.author.service.AuthorService;
import kr.co.toondra.base.controller.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/admin/author")
@Controller
public class AuthorController extends BaseController {
		
	@Autowired
	AuthorService service = new AuthorService();
	
	@RequestMapping(value="/authorListView")
	public String authorListView(){
		
		return "toondra/author/authorListView";
		
	}
	
	@RequestMapping(value="/authorList")
	public String authorList(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		pMap = service.authorList(pMap);
		model.addAllAttributes(pMap);
		
		return JSON_VIEW;
	}
	
	@RequestMapping(value="/insertView")
	public String authorCreateView() {
		
		return "toondra/author/authorInsert";
	}
	
	@RequestMapping(value="/insertAuthor")
	public String insertAuthor(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.insertAuthor(pMap);
		model.addAttribute("result", pMap.get("result"));
		
		return "toondra/author/authorInsert";
	}
	
	@RequestMapping(value="/idCheck")
	public String idCheck(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		model.addAllAttributes(service.idCheck(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping(value="/popup/postPopup")
	public String postPopup(HttpServletRequest request,Model model) {
		
		PMap pMap = new PMap(request);
		model.addAllAttributes(pMap);
		
		return "toondra/popup/postApiPopup";
	}
	
	@RequestMapping(value="/authorDetail")
	public String getAuthor(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.getAuthor(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/author/authorUpdate";
	}
	
	@RequestMapping(value="/updateAuthor")
	public String updateAuthor(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.updateAuthor(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/author/authorUpdate";
	}
	
	@RequestMapping(value="/deleteAuthor")
	public String deleteAuthor(HttpServletRequest request,Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.deleteAuthor(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/author/authorListView";
	}
	
}
