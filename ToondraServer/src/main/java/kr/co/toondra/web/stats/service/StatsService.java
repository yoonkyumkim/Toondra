package kr.co.toondra.web.stats.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.stats.dao.StatsDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatsService {
	
	@Autowired
	StatsDao dao;
	
	public PMap genreList(PMap pMap) {
		List<HashMap<String,Object>> genreList = new ArrayList<HashMap<String,Object>>();
		genreList = dao.genreList();
		pMap.put("genreList", genreList);
		
		return pMap;
	}

	public HashMap<String, Object> statsList(PMap pMap) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int totalcnt = dao.getStatsTotalCnt(pMap);
		List<HashMap<String, Object>> statsList = dao.getStatsList(pMap);
		
		result.put("iTotalRecords", totalcnt);
		result.put("iTotalDisplayRecords", totalcnt);
		result.put("aaData", statsList);
		result.put("startRegDate", pMap.get("startRegDate"));
		result.put("endRegDate", pMap.get("endRegDate"));
		
		return result;
	}

	public HashMap<String, Object> contentStatsList(PMap pMap) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int totalcnt = dao.getContentStatsTotalCnt(pMap);
		List<HashMap<String, Object>> statsList = dao.getContentStatsList(pMap);
		
		result.put("iTotalRecords", totalcnt);
		result.put("iTotalDisplayRecords", totalcnt);
		result.put("aaData", statsList);
		result.put("startRegDate", pMap.get("startRegDate"));
		result.put("endRegDate", pMap.get("endRegDate"));
		
		return result;
	}
	

}
