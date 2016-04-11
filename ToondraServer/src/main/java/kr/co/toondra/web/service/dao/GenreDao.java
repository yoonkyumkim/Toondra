package kr.co.toondra.web.service.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;

@Repository
public class GenreDao extends BaseDao {

	public List<HashMap<String, Object>> getGenreList() {
		return selectList("Genre.getGenreList");
	}

	public int getGenreWorkCount(ArrayList<HashMap<String, Object>> deleteGenreList) {
		return selectOne("Genre.getGenreWorkCount", deleteGenreList);
	}
	
	public int insertGenre(HashMap<String, Object> param) {
		return insert("Genre.insertGenre", param); 
	}

	public int updateGenre(HashMap<String, Object> param) {
		return update("Genre.updateGenre", param);
	}

	public int deleteGenre(HashMap<String, Object> param) {
		return update("Genre.deleteGenre", param);
	}

}
