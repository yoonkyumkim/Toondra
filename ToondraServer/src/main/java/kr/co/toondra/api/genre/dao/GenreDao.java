package kr.co.toondra.api.genre.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository("apiGenreDao")
public class GenreDao extends BaseDao {
	
	
	public List<HashMap<String, Object>> getGenreList(HashMap<String, Object> param) {
		return selectList("API.Genre.genreList", param);
	}
	
	public int getGenreTotalCnt(HashMap<String, Object> param) {
		return selectOne("API.Genre.genreTotalCnt", param);
	}
	
}
