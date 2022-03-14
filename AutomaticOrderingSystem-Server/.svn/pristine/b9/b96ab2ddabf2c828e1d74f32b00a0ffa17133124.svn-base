package com.aos.user;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/aos")
public class UserController {
	@Autowired
	private UserServiceImpl userService;
	
	
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/login");
		return modelAndView;
	}
	
	@PostMapping("/login")
	public ModelAndView login(@Valid User account, Errors errors) {
		if (errors.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/aos/login");
			return modelAndView;
		}
		
		ModelAndView modelAndView = new ModelAndView();
		String path = userService.login(account);
		modelAndView.setViewName("redirect:"+path);
		return modelAndView;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		userService.logout();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/aos/login");
		return modelAndView;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new UserValidator());
	}
	
}
