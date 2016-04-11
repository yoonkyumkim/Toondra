package kr.co.toondra.common.extension.resolver;

import java.lang.annotation.Annotation;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.extension.annotation.RequestPMap;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class RequestPMapArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter param,
			ModelAndViewContainer mnv, NativeWebRequest request,
			WebDataBinderFactory binderFactory) throws Exception {
		
		Annotation[] paramAnns = param.getParameterAnnotations();  
		Class<?> paramType = param.getParameterType();  
		   
        for (Annotation paramAnn : paramAnns) {
        	
        	if (RequestPMap.class.isInstance(paramAnn)) {  

        		if(paramType.isAssignableFrom(PMap.class)){
	            	HttpServletRequest httprequest = (HttpServletRequest) request.getNativeRequest();
	            	return new PMap(httprequest); 
	            } else {
	            	return WebArgumentResolver.UNRESOLVED;
	            }
        	}
        }  
		
		return WebArgumentResolver.UNRESOLVED;
	}

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.hasParameterAnnotation(RequestPMap.class);
	}
	
}
