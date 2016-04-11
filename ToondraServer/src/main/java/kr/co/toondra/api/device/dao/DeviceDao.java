package kr.co.toondra.api.device.dao;

import java.util.HashMap;

import kr.co.toondra.base.dao.BaseDao;

import org.springframework.stereotype.Repository;


@Repository("apiDeviceDao")
public class DeviceDao extends BaseDao {

	public int getDeviceIdOverlapCheck(HashMap<String, Object> param) {
		return selectOne("API.Device.getDeviceIdOverlapCheck", param);
	}
	
	public int updateDeviceInfo(HashMap<String, Object> param) {
		return update("API.Device.updateDeviceInfo", param);
	}
	
	public int insertDeviceInfo(HashMap<String, Object> param) {
		return insert("API.Device.insertDeviceInfo", param);
	}
	
	public HashMap<String, Object> getDeviceInfo(HashMap<String, Object> param){
		return selectOne("API.Device.getDeviceInfo", param);
	}
}
