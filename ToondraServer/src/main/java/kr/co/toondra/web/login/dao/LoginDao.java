package kr.co.toondra.web.login.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import kr.co.toondra.base.dao.BaseDao;
import kr.co.toondra.common.collection.PMap;

@Repository
public class LoginDao extends BaseDao{

	public HashMap<String, Object> login(PMap pMap) {
		return selectOne("Login.login", pMap);
	}
}
