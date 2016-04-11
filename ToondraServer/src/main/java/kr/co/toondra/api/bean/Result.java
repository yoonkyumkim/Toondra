package kr.co.toondra.api.bean;

import java.util.HashMap;

public class Result {

	//아오 애초에 API 데이터명을 이렇게 하니 자바에서도 언더바지..
	private String resp_code;
	private String resp_msg;
	private HashMap<String, Object> data;
	
	public Result(){
		this.resp_code = "200";
		this.resp_msg = "success";
		data = new HashMap<String, Object>();
	}
	
	public void setResp_code(String respCode) {
		this.resp_code = respCode;
	}
	
	public String getResp_code() {
		return this.resp_code;
	}
	
	public String getResp_msg() {
		return resp_msg;
	}

	public void setResp_msg(String resp_msg) {
		this.resp_msg = resp_msg;
	}

	public void setData(HashMap<String, Object> data){
		this.data = data;
	}
	public Object getData() {
		return this.data;
	}
	
	public void putObject(String key, Object value) {
		if(data != null) this.data.put(key, value);
	}
	
	public Object getObject(String key) {
		return (data != null) ? data.get(key) : null;
	}
	
	public void removeObject(String key) {
		if(data != null) data.remove(key);
	}
}
