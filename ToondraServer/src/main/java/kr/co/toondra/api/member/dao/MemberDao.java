package kr.co.toondra.api.member.dao;

import java.util.HashMap;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;


@Repository("apiMemberDao")
public class MemberDao extends BaseDao {

	
	public int getEmailOverlapCheck(HashMap<String, Object> param) {
		return selectOne("API.Member.getEmailOverlapCheck", param);
	}
	
	public int insertMember(HashMap<String, Object> param) {
		return insert("API.Member.insertMember", param);
	}
	
	public int updateMemberConfirm(HashMap<String, Object> param) {
		return update("API.Member.updateMemberConfirm", param);
	}
	
	public HashMap<String, Object> getMemberInfo(HashMap<String, Object> param) {
		return selectOne("API.Member.getMemberInfo", param);
	}
	
	public String getMemberSeq(String loginKey) {
		return selectOne("API.Member.getMemberSeq", loginKey);
	}
	
	public int insertMemberLogin(HashMap<String, Object> param) {
		return insert("API.Member.insertMemberLogin", param);
	}
	
	public HashMap<String, Object> getDeviceInfo(HashMap<String, Object> param) {
		return selectOne("API.Member.getDeviceInfo", param);
	}
	
	public int getMemberLoginCheck(HashMap<String, Object> param) {
		return selectOne("API.Member.getMemberLoginCheck", param);
	}
	
	public int loginKeyDuplicationCheck(HashMap<String, Object> param) {
		return selectOne("API.Member.loginKeyDuplicationCheck", param);
	}
	
	public int updateMemberLogin(HashMap<String, Object> param) {
		return update("API.Member.updateMemberLogin", param);
	}
	
	public int updateMemberLogout(String loginKey) {
		return update("API.Member.updateMemberLogout", loginKey);
	}
	
	public int updateMemberPwChange(HashMap<String, Object> param) {
		return update("API.Member.updateMemberPwChange", param);
	}
	
	public int updateMemberPw(HashMap<String, Object> param) {
		return update("API.Member.updateMemberPw", param);
	}
	
	public String getEncKey(HashMap<String, Object> param) {
		return selectOne("API.Member.getEncKey", param);
	}
	
	public String getEncKeyFromLoginKey(HashMap<String, Object> param) {
		return selectOne("API.Member.getEncKeyFromLoginKey", param);
	}
	
	public int updatePushState(HashMap<String, Object> param) {
		return update("API.Member.updatePushState", param);
	}
	
	
}
