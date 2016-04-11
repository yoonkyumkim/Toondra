package kr.co.toondra.common.extension.resolver;

import java.lang.annotation.Annotation;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.common.extension.annotation.RequestAttribute;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class RequestAttributeArgumentResolver implements HandlerMethodArgumentResolver {

	@SuppressWarnings("unchecked")
	@Override
	public Object resolveArgument(MethodParameter param,
			ModelAndViewContainer mnv, NativeWebRequest request,
			WebDataBinderFactory binderFactory) throws Exception {
		
		Annotation[] paramAnns = param.getParameterAnnotations();  
		Class<?> paramType = param.getParameterType();  
		   
        for (Annotation paramAnn : paramAnns) {  
            if (RequestAttribute.class.isInstance(paramAnn)) {  
            	
            	RequestAttribute reqAttr = (RequestAttribute) paramAnn;  
            	HttpServletRequest httprequest = (HttpServletRequest) request.getNativeRequest();
            	
            	Object result = null;
            	if(Map.class.isAssignableFrom(paramType)){
            		if(reqAttr.value().equals("")) {
            			Map<String, Object> attrMap = (paramType.isAssignableFrom(Map.class)) ? new HashMap<String, Object>() : (Map<String, Object>)paramType.newInstance();
            					
            			String name = null;
						Enumeration<String> names = httprequest.getAttributeNames();
            			while(names.hasMoreElements()) {
            				name = names.nextElement();
            				attrMap.put(name, httprequest.getAttribute(name));
            			}
            			result = attrMap;
            		} else {
            			result = httprequest.getAttribute(reqAttr.value());
            		}
            	} else {
            		result = httprequest.getAttribute(reqAttr.value());
            	}
            	
                return result;  
            }  
        }  
		
		return WebArgumentResolver.UNRESOLVED;
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.hasParameterAnnotation(RequestAttribute.class);
	}
	
}
