package kr.co.toondra.web.content.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class ContentDao extends BaseDao{

	public HashMap<String, Object> getWork(PMap pMap) {
		return selectOne("Content.getWork", pMap);
	}

	public int getContentTotalCnt(PMap pMap) {
		return selectOne("Content.contentTotalCnt", pMap);
	}

	public List<HashMap<String, Object>> getContentList(PMap pMap) {
		return selectList("Content.contentList", pMap);
	}

	public List<HashMap<String, Object>> getAuthorList(PMap pMap) {
		return selectList("Content.authorList", pMap);
	}
	
	public int insertContent(PMap pMap) {
		return insert("Content.insertContent", pMap);
	}
	
	public HashMap<String, Object> getThumbnail(PMap pMap) {
		return selectOne("Content.getThumbnail", pMap);
	}
	
	public HashMap<String, Object> getContentSeq(PMap pMap) {
		return selectOne("Content.getContentSeq", pMap);
	}
	public int insertContentFile(PMap pMap) {
		return insert("Content.insertContentFile", pMap);
	}
	
	public int updateContentState(PMap pMap) {
		return update("Content.updateContentState", pMap);
	}
	
	
	public int deleteContent(PMap pMap) {
		return update("Content.deleteContent", pMap);
	}

	public HashMap<String, Object> getContent(PMap pMap) {
		return selectOne("Content.getContent",pMap);
	}

	public List<HashMap<String, Object>> getContentFile(PMap pMap) {
		return selectList("Content.getContentFile", pMap);
	}

	public int updateContent(PMap pMap) {
		return update("Content.updateContent", pMap);
	}

	public int deleteContentFile(HashMap<String, Object> map) {
		return delete("Content.deleteContentFile", map);
	}
	
	public HashMap<String, Object> getContentFilePath(HashMap<String,Object> map) {
		return selectOne("Content.getContentFilePath", map);
	}

	public HashMap<String,Object> getContentKey(PMap pMap) {
		return selectOne("Content.getContentKey", pMap);
	}

	public int insertPush(PMap pMap) {
		return insert("Content.insertPush", pMap);
	}
	
	public int updateWorkPostDate(PMap pMap) {
		return update("Content.updateWorkPostDate", pMap);
	}
	
}
