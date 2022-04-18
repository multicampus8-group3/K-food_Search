package com.campus.myapp.config;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.campus.myapp.interceptor.AdminInterceptor;
import com.campus.myapp.interceptor.LoginInterceptor;
import com.campus.myapp.interceptor.OwnerInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	/*예시
	private static final List<String> LOGIN_URL = Arrays.asList(
			"/member/**","/admin/**","/restaurant/**");
	private static final List<String> ADMIN_URL = Arrays.asList(
			"/member/**","/admin/**","/restaurant/**");
	private static final List<String> OWNER_URL = Arrays.asList(
			"/member/**","/admin/**","/restaurant/**");
	*/
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//(참고: https://kitty-geno.tistory.com/83
		//registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/member/**");
		//registry.addInterceptor(new LoginInterceptor()).excludePathPatterns("/member/**");
		
		//인터셉터 적용
		//registry.addInterceptor(new LoginInterceptor()).addPathPatterns(LOGIN_URL);
		//registry.addInterceptor(new AdminInterceptor()).addPathPatterns(ADMIN_URL);
		//registry.addInterceptor(new OwnerInterceptor()).addPathPatterns(OWNER_URL);
		
	}
}
