package kr.co.toondra.base.controller;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.common.exception.LogicException;
import kr.co.toondra.common.exception.RuntimeLogicException;
import kr.co.toondra.common.util.CommonUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

public class BaseController {
	
	protected final String JSON_VIEW = "jacksonView";
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionHandler(HttpServletRequest request, Exception e) {
		//TODO
		e.printStackTrace();
		
		String errCode = "900";
		String errName = e.getClass().getName();
		String errMsg = e.getMessage();
		
		if(errName.equals("kr.co.toondra.common.exception.LogicException")) {
			logger.error("LogicException");
			errCode = ((LogicException)e).getCode();
			errMsg = ((LogicException)e).getMessage();
		}  else if (errName.equals("kr.co.toondra.common.exception.RuntimeLogicException")) {
			logger.error("RuntimeLogicException");
			errMsg = ((RuntimeLogicException)e).getMessage();
			errCode = ((RuntimeLogicException)e).getCode();
		} else if(errName.equals("org.springframework.web.bind.MissingServletRequestParameterException")) {
			logger.error("MissingServletRequestParameterException");
			errMsg = "MissingServletRequestParameterException";
			errCode = "301";
		} else if (errName.equals("java.lang.NullPointerException")) {
			logger.error("NullPointerException");
			errMsg = "NullPointerException";
			errCode = "302";
		}  else if (errName.equals("org.springframework.beans.TypeMismatchException")) {
			logger.error("TypeMismatchException");
			errMsg = "TypeMismatchException";
			errCode = "303";
		} else if (errName.equals("java.lang.NumberFormatException")) {
			logger.error("NumberFormatException");
			errMsg = "NumberFormatException";
			errCode = "304";
		} else if (errName.equals("java.lang.IOException")) {
			logger.error("IOException");
			errMsg = "IOException";
			errCode = "305";
		} else if (errName.equals("org.springframework.web.HttpMediaTypeNotSupportedException")) {
			logger.error("HttpMediaTypeNotSupportedException");
			errMsg = "HttpMediaTypeNotSupportedException";
			errCode = "306";
		} else if(errName.equals("org.springframework.jdbc.BadSqlGrammarException")) {
			logger.error("BadSqlGrammarException");
			errMsg = "BadSqlGrammarException";
			errCode = "307";
		} else if(errName.equals("org.springframework.web.client.ResourceAccessException")) {
			logger.error("ResourceAccessException");
			errMsg = "ResourceAccessException";
			errCode = "308";
		} else if(errName.equals("java.lang.RuntimeException.RuntimeException")) {
			logger.error("RuntimeException");
			errMsg = "RuntimeException";
			errCode = "309";
		} else {
			logger.error(e.getMessage());
		}
		if(errMsg.equals("")) {
			errMsg = "Unknown Error";
		}
		
		ModelAndView mnv = new ModelAndView();
		if(!CommonUtil.isNull(request.getHeader("X-Requested-With")) 
			&& "XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			mnv.setViewName("jacksonView");
			mnv.addObject("result", false);
			mnv.addObject("errCode", errCode);
			mnv.addObject("msg", errMsg);
		} else {
			mnv.setViewName("toondra/common/error/error");
			mnv.addObject("errCode", errCode);
			mnv.addObject("msg", errMsg);
		}
		
		return mnv;
	}
	
}
