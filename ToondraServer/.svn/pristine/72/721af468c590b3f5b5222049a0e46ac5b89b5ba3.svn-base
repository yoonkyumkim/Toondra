package kr.co.toondra.api.genre.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.api.bean.Result;
import kr.co.toondra.api.genre.dao.GenreDao;
import kr.co.toondra.common.exception.LogicException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("apiGenreService")
public class GenreService {

	@Autowired
	private GenreDao dao;
	
	public Result getGenreList(HashMap<String, Object> param) throws Exception{
		
		Result result = new Result();
		
		List<HashMap<String, Object>> genreList = new ArrayList<HashMap<String, Object>>();
		
		int genreTotalCnt = 0;
		
		genreTotalCnt = dao.getGenreTotalCnt(param);
		
		genreList = dao.getGenreList(param);
		
		if(genreTotalCnt != genreList.size()) {
			throw new LogicException("total cnt, genreList cnt disagreement","408");
		}
		
		result.putObject("total_cnt", genreTotalCnt);
		result.putObject("genre_list", genreList);
		
		
		return result;
	}
	
}
