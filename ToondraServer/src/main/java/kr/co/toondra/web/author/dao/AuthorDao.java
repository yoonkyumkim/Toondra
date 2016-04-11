package kr.co.toondra.web.author.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class AuthorDao extends BaseDao{
	
	public int createAuthor(PMap pMap){
		return insert("Author.create", pMap);
	}

	public HashMap<String,Object> getSeq() {
		return selectOne("Author.getSeq");
	}

	public int createAddr(HashMap<String, Object> map) {
		return insert("Author.createAddr",map);
	}

	public int createPhone(HashMap<String, Object> map) {
		return insert("Author.createPhone", map);
	}

	public HashMap<String, String> idCheck(PMap pMap) {
		// TODO Auto-generated method stub
		return selectOne("Author.idChk", pMap);
	}
	
	public int getAuthorTotalCnt(PMap pMap) {
		return selectOne("Author.authorTotalCnt", pMap);
	}
	
	public List<HashMap<String,Object>> getAuthorList(PMap pMap){
		return selectList("Author.authorList", pMap);
	}

	public HashMap<String, Object> getAuthor(PMap pMap) {
		return selectOne("Author.getAuthor", pMap);
	}

	public List<HashMap<String, Object>> getAddr(PMap pMap) {
		return selectList("Author.getAddrList", pMap);
	}

	public List<HashMap<String, Object>> getPhone(PMap pMap) {
		return selectList("Author.getPhoneList", pMap);
	}

	public int delAddr(HashMap<String, Object> map) {
		return delete("Author.delAddr", map);
		
	}

	public int updateAddr(HashMap<String, Object> map) {
		return update("Author.updateAddr", map);
		
	}

	public int delPhone(HashMap<String, Object> map) {
		return delete("Author.delPhone", map);
	}

	public int updatePhone(HashMap<String, Object> map) {
		return update("Author.updatePhone", map);
	}

	public int deleteAuthor(PMap pMap) {
		return delete("Author.deleteAuthor", pMap);
	}

	public int updateAuthor(PMap pMap) {
		return update("Author.updateAuthor", pMap);
	}

	public int getWork(PMap pMap) {
		return selectOne("Author.getWork", pMap);
	}
	
	

}
