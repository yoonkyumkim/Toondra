package kr.co.toondra.common.extension.adaptor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.method.annotation.MapMethodProcessor;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

public class AhopeRequestMappingHandlerAdapter extends RequestMappingHandlerAdapter {
	
	//resolver 순서 중 MapMethodProcessor를 마지막 순서로 재정렬
	@Override
	public void afterPropertiesSet() {
		
		super.afterPropertiesSet();
		
		if(getArgumentResolvers() != null) {
			List<HandlerMethodArgumentResolver> resolvers = getArgumentResolvers().getResolvers();
			List<HandlerMethodArgumentResolver> ahopeResolvers = new ArrayList<HandlerMethodArgumentResolver>();
			
			MapMethodProcessor mmp = null;
			for(HandlerMethodArgumentResolver resolver : resolvers) {
				if(resolver instanceof MapMethodProcessor){
					mmp = (MapMethodProcessor)resolver;
				} else {
					ahopeResolvers.add(resolver);
				}
			}
			if(mmp != null) {
				ahopeResolvers.add(mmp);
			}
			
			setArgumentResolvers(ahopeResolvers);
		}
	}

	
}
