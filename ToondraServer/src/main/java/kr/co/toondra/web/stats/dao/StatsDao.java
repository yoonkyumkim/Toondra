package kr.co.toondra.web.stats.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

import org.springframework.stereotype.Repository;

@Repository
public class StatsDao extends BaseDao {
	
	public List<HashMap<String,Object>> genreList() {
		return selectList("Stats.genreList");
	}

	public int getStatsTotalCnt(PMap pMap) {
		return selectOne("Stats.getStatsTotalCnt", pMap);
	}

	public List<HashMap<String, Object>> getStatsList(PMap pMap) {
		return selectList("Stats.getStatsList", pMap);
	}
	
	public int getSales(PMap pMap) {
		return selectOne("Stats.getSales", pMap);
	}

	public List<HashMap<String, Object>> getContentStatsList(PMap pMap) {
		return selectList("Stats.getContentStatsList", pMap);
	}
	public int getContentStatsTotalCnt(PMap pMap) {
		return selectOne("Stats.getContentStatsTotalCnt", pMap);
	}

}
