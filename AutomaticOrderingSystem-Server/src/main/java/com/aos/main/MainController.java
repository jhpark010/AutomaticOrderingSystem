package com.aos.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/aos")
public class MainController {
	@Autowired
	private MainServiceImpl mainServiceImpl;
	
	@GetMapping("/main")
	public ModelAndView main() {
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, String>> result = mainServiceImpl.prepareMain();
		modelAndView.setViewName("/main/mainView");
		modelAndView.addObject("relationData", result);
		return modelAndView;
	}
}
