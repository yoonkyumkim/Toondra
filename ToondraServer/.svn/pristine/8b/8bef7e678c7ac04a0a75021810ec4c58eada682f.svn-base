package kr.co.toondra.web.sample.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;



@Repository
public class SampleDao extends BaseDao {
	
	public List<HashMap<String,Object>> getGetTogetherList(){
		return selectList("sample.getMemberList");
	}
	
	public int insertComment(){
		return insert("sample.insertComment");
	}
	public int insertComment2(){
		return insert("sample.insertComment2");
	}
}