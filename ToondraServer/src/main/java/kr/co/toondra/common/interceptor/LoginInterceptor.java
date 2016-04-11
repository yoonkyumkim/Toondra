package kr.co.toondra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor{
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		logger.debug("afterCompletion");
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.debug("postHandle");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		logger.debug("preHandle");
		HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect("/admin/login/loginView");
			return false;
		}
		if(session.getAttribute("s_manager_seq") == null){
			response.sendRedirect("/admin/login/loginView");
			return false;
		} 
		return true;
	}
	
}
