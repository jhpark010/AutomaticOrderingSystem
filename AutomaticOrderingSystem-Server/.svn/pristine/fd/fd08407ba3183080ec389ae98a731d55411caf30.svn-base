package com.aos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.aos.interceptor.LoggerInterceptor;

@SpringBootApplication
@ComponentScan(basePackages = {"com.aos"})
public class AosApplication implements WebMvcConfigurer {
	
	public static void main(String[] args) {
		SpringApplication.run(AosApplication.class, args);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoggerInterceptor()).addPathPatterns("/**").excludePathPatterns("/aos/login")
		.excludePathPatterns("/css/**").excludePathPatterns("/lib/**")
		.excludePathPatterns("/js/**").excludePathPatterns("/aos/incomeorderweight");
	}
	
}
