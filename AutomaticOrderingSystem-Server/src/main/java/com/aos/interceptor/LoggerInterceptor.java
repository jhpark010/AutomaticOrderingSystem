package com.aos.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoggerInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			Object authCheck = session.getAttribute("Auth_id");
			if (authCheck != null) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/aos/login");
		return false;
	}
}
		