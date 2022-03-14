package com.aos.error;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CustomErrorController implements ErrorController{
	@RequestMapping("/error")
	public ModelAndView handleError(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				mav.setViewName("/errors/404");
				return mav;
			} else if(statusCode == HttpStatus.FORBIDDEN.value()) {
				mav.setViewName("/errors/500");
				return mav;
			} else {
				mav.setViewName("/errors/404");
				return mav;
			}
		}
		return mav;
	}

	@Override
	public String getErrorPath() {
		return null;
	}
}
