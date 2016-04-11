package kr.co.toondra.common.collection;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public class PMap extends HashMap<String, Object> {
	
	private static final long serialVersionUID = 5911208333480541440L;
	private HttpServletRequest request = null;
	

	public PMap() {
	}
	
	@SuppressWarnings("unchecked")
	public PMap(HttpServletRequest request) {
		
		Enumeration<String> names = request.getParameterNames();
		
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			Object param = request.getParameter(name);
			super.put(name, param);
		}
		
		
		this.request = request;
	}
	
	
	/*
	 * map 값 추가
	 */
	public PMap addMap(HashMap<String, Object> map) {
		
		if(map != null) {
			
			Iterator<String> it = map.keySet().iterator();
			
			while(it.hasNext()) {
				String key = it.next();
				super.put(key, map.get(key));
			}
		}
		
		
		return this;
	}
	
	/**
	 *  containKeys
	 * 
	 * */
	public boolean containKeys(String[] keys) {
		
		for(String key : keys) {
			if(!super.containsKey(key)) {
				super.put("containsKeysFalseData", key);
				return false;
			}
			
		}
		return true;
	}
	
	/**
	 * removes
	 * */
	public PMap removes(String[] keys) {
		
		for(String key : keys) {
			super.remove(key);
		}
		
		return this;
	}
	
	
	/**
	 * get Request
	 * */
	public HttpServletRequest getRequest() {
		return request;
	}
	
	
	/**
	 * get Multipart Request
	 * */
	public MultipartHttpServletRequest getMultipartRequest() {
		
		if(request instanceof MultipartHttpServletRequest) {
			return (MultipartHttpServletRequest) request;
		} else {
			return null;
		}
	}
	
	
	/**
	 * Object 값 반환 
	 * */
	public Object get(String name) {
		
		Object result = super.get(name);
		
		if(result == null) {
			result = "";
		}
		
		return result;
	}
	
	/**
	 * Integer 반환
	 * */
	public int getInt(String name) {
		
		int result = 0;
		
		Object obj = super.get(name);
		
		try{
			
			if(obj != null) {
				
				if(obj instanceof String) {
					result = Integer.parseInt((String)obj);
				} else if(obj instanceof Number) {
					result = ((Number)obj).intValue();
				}
			}
			
		} catch(Exception e) {
			result = 0;
		}
		
		return result;
	}
	
	
	/**
	 * Boolean 값 반환
	 * */
	public Boolean getBoolean(String name) {
		
		boolean result = false;
		
		Object obj = super.get(name);
		
		try{
			
			if(obj != null) {
				
			}
			
		} catch(Exception e) {
			result = false;
		}
		
		
		return result;
	}
	
	/**
	 * String 값 반환
	 **/
	public String getString(String name) {
		String result = "";
		Object obj = super.get(name);
		try {
			if (obj != null) {
				if (obj instanceof String) {
					result = (String)obj;
				} else if (obj instanceof Boolean) {
					result = String.valueOf((Boolean)obj);
				} else if (obj instanceof Integer) {
					result = String.valueOf((Integer)obj);
				} else if (obj instanceof Long) {
					result = String.valueOf((Long)obj);
				} else if (obj instanceof Short) {
					result = String.valueOf((Short)obj);
				} else if (obj instanceof Float) {
					result = String.valueOf((Float)obj);
				} else if (obj instanceof Double) {
					result = String.valueOf((Double)obj);
				} else if (obj instanceof Character) {
					result = String.valueOf((Character)obj);
				} else if (obj instanceof BigDecimal) {
					result = ((BigDecimal)obj).toString();
				} else {
					result = obj.toString();
				}
			}
		} catch(Exception e) {
			result = "";
		}
		return result;
	}
	
	/**
	 * 객체 명 반환
	 **/
	public String[] getNames() {
		Iterator<String> iterator = this.keySet().iterator();
		String[] names = new String[this.keySet().size()];
		for (int i=0; iterator.hasNext(); i++) {
			names[i] = iterator.next();
		}
		return names;
	}
	
}
