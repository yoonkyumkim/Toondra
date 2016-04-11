package kr.co.toondra.common.extension.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.web.bind.annotation.ValueConstants;

@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestAttribute {
	
	String value() default "";
	
	boolean required() default true;
	
	String defaultValue() default ValueConstants.DEFAULT_NONE;
}
