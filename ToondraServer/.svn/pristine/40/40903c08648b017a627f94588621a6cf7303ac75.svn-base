package kr.co.toondra.web.stats.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.toondra.base.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.stats.service.StatsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping(value="/admin/stats")
@Controller
public class StatsController extends BaseController{
	
	@Autowired
	StatsService service;
	
	@RequestMapping(value="/purchase/statsListView")
	public String statsListView(HttpServletRequest request) {
		
		
		return "/toondra/stats/salesStatsList";
	}
	
	@RequestMapping(value="/purchase/statsList")
	public String statsList(HttpServletRequest request,Model model){
		
		PMap pMap = new PMap(request);
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		model.addAllAttributes(service.statsList(pMap));
		
		return JSON_VIEW;
	}
	
	@RequestMapping("/statsExcel")
	public String statsExcel(HttpServletRequest request, HttpServletResponse response, Model model) {
		PMap pMap = new PMap(request);
		model.addAllAttributes(service.statsList(pMap));
		  
		return "StatsExcelView";
	}
	
	@RequestMapping(value="/content/statsListView")
	public String contentStatsListView(HttpServletRequest request ,Model model) {
		
		PMap pMap = new PMap(request);
		pMap = service.genreList(pMap);
		model.addAllAttributes(pMap);
		
		return "/toondra/stats/contentStatsList";
	}
	
	@RequestMapping(value="/content/statsList")
	public String contentStatsList(HttpServletRequest request,Model model){
		
		PMap pMap = new PMap(request);
		pMap.put("iDisplayStart", pMap.getInt("iDisplayStart"));
		pMap.put("iDisplayLength", pMap.getInt("iDisplayLength"));
		model.addAllAttributes(service.contentStatsList(pMap));
		
		return JSON_VIEW;
	}
	@RequestMapping("/contentExcel")
	public String contentExcel(HttpServletRequest request, HttpServletResponse response, Model model) {
		PMap pMap = new PMap(request);
		model.addAllAttributes(service.contentStatsList(pMap));
		  
		return "ContentExcelView";
	}
}
