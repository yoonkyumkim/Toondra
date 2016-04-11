package kr.co.toondra.web.login.service;

import java.util.HashMap;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.util.CommonUtil;
import kr.co.toondra.common.util.Hash;
import kr.co.toondra.common.util.SessionUtil;
import kr.co.toondra.web.login.dao.LoginDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	LoginDao dao = new LoginDao();
	
	public boolean login(PMap pMap) throws Exception {
		
		pMap.put("password", Hash.sha512(pMap.getString("password")));
		
		HashMap<String, Object> userInfo = dao.login(pMap);
		if(CommonUtil.isNull(userInfo)) {
			throw new LogicException("Login Failed");
		}
		
		SessionUtil session = new SessionUtil(pMap.getRequest());
		session.setSessionValue("s_manager_seq", userInfo.get("manager_seq"));
		session.setSessionValue("s_name", userInfo.get("name"));
		
		return true;
	}

}
