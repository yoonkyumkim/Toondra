package kr.co.toondra.web.work.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.work.service.WorkService;

@RequestMapping(value="/admin/work")
@Controller
public class WorkController extends BaseController{
	
	@Autowired
	WorkService service = new WorkService();
	
	@RequestMapping(value="/workListView")
	public String workListView(HttpServletRequest request,Model model){
		
		PMap pMap = new PMap(request);
		pMap = service.genreList(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/work/workList";
	}
	
	@RequestMapping(value="/workList")
	public String workList(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		model.addAllAttributes(service.workList(pMap));
		
		return JSON_VIEW;
	}

	@RequestMapping(value="/insertWorkView")
	public String insertWorkView(HttpServletRequest request,Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.genreList(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/work/workInsert";
	}
	
	@RequestMapping(value="/searchAuthor")
	public String searchAuthor(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		pMap = service.searchAuthor(pMap);
		model.addAllAttributes(pMap);
		
		return JSON_VIEW;
	}
	
	@RequestMapping(value="/popup/authorPopup")
	public String authorPopup(HttpServletRequest request,Model model) {
		
		PMap pMap = new PMap(request);
		model.addAllAttributes(pMap);
		return "toondra/popup/authorPopup";
	}
	
	@RequestMapping(value="/insertWork")
	public String insertWork(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.insertWork(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/work/workInsert";
	}
	
	@RequestMapping(value="/updateWorkService")
	public String updateWorkService(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		service.updateWorkState(pMap);
		model.addAttribute("result", true);
		
		return JSON_VIEW;
	}
	
	@RequestMapping(value="/deleteWork")
	public String deleteWork(HttpServletRequest request, Model model) {
		
		PMap pMap = new PMap(request);
		service.deleteWork(pMap);
		model.addAttribute("result", true);
		
		return JSON_VIEW;
	}

	
	@RequestMapping(value="/workDetail")
	public String getWork(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		pMap = service.getWork(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/work/workDetail";
	}
	
	@RequestMapping(value="/updateWork")
	public String updateWork(HttpServletRequest request, Model model){
		
		PMap pMap = new PMap(request);
		pMap = service.updateWork(pMap);
		model.addAllAttributes(pMap);
		
		return "toondra/work/workDetail";
	}
}
