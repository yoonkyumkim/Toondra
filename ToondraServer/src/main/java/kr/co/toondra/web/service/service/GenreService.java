package kr.co.toondra.web.service.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.util.CommonUtil;
import kr.co.toondra.web.service.dao.GenreDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenreService {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private GenreDao dao;

	public List<HashMap<String, Object>> getGenreList() {
		return dao.getGenreList();
	}

	public boolean updateGenre(PMap pMap) throws Exception {
		
		String genreInfos = pMap.getString("genreInfos");
		ArrayList<HashMap<String, Object>> deleteGenreList = new ArrayList<HashMap<String, Object>>(dao.getGenreList());
		ArrayList<HashMap<String, Object>> insertGenreList = new ArrayList<HashMap<String, Object>>();
		ArrayList<HashMap<String, Object>> updateGenreList = new ArrayList<HashMap<String, Object>>();
		
		if(!CommonUtil.isNull(genreInfos)) {
			String[] genreInfoArray = genreInfos.split(",");
			
			HashMap<String, Object> genreParam = null;
			for (String genreInfo : genreInfoArray) {
				genreParam = new HashMap<String, Object>();
				String[] genreNameSeq = genreInfo.split("\\|");
				String genreName = genreNameSeq[0];
				
				if(genreNameSeq.length == 1 || CommonUtil.isNull(genreNameSeq[1])){
					//신규
					genreParam.put("genreName", genreName);
					insertGenreList.add(genreParam);
				} else {
					int genreSeq = Integer.parseInt(genreNameSeq[1]);
					for(HashMap<String, Object> genre : deleteGenreList) {
						if(((Integer)genre.get("genreSeq")) == genreSeq) {
							//수정
							genreParam.put("genreSeq", genreSeq);
							genreParam.put("genreName", genreName);
							updateGenreList.add(genreParam);
							
							deleteGenreList.remove(genre);
							break;
						}
					}
				}
			}
		}
		
		if(deleteGenreList.size() > 0 && dao.getGenreWorkCount(deleteGenreList) > 0) {
			throw new LogicException("장르가 쓰이고 있는 작품이 있습니다.");
		}
		
		for(HashMap<String, Object> param : deleteGenreList) {
			dao.deleteGenre(param);
		}
		
		for(HashMap<String, Object> param : updateGenreList) {
			dao.updateGenre(param);
		}
		
		for(HashMap<String, Object> param : insertGenreList) {
			dao.insertGenre(param);
		}
		
		return true;
	}
	
}
