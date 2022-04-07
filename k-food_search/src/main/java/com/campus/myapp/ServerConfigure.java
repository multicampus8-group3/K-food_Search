package com.campus.myapp;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	private static final List<String> URL_PATERRNS = Arrays.asList(
			"/board/boardWrite","/board/boardWriteOk",
			"/board/boardEdit","/board/boardEditOk");
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATERRNS);
	}
}
