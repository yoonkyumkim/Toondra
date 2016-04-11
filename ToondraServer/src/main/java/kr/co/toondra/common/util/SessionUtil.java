package kr.co.toondra.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
	
	HttpServletRequest request = null;
	
	public SessionUtil(HttpServletRequest request) {
		this.request = request;
	}

	public void setSessionValue(String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}
	
	public Object getSessionValue(String key) {
		HttpSession session = request.getSession();
		return session.getAttribute(key);
	}
	
	public void getInvalidate(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
	
}
