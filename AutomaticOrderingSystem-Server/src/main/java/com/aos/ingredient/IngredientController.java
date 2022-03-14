package com.aos.ingredient;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/aos")
public class IngredientController {
	@Autowired
	private IngredientServiceImpl ingredientServiceImpl;
	
	@GetMapping("/ingredient")
	public ModelAndView ingredientList(String log) {
		ModelAndView modelAndView = new ModelAndView();
		List<Map<String, String>> result = ingredientServiceImpl.ingredientList();
		modelAndView.setViewName("/ingredient/ingredientList");
		modelAndView.addObject("data", result);
		modelAndView.addObject("log", log);
		return modelAndView;
	}
	
	@GetMapping("/ingredient/registform")
	public ModelAndView registIngredient() {
		ModelAndView modelAndView = new ModelAndView();
		List<String> supplierList = ingredientServiceImpl.getSupplierList();
		modelAndView.setViewName("/ingredient/ingredientRegistForm");
		modelAndView.addObject("supplierList", supplierList);
		
		return modelAndView;
	}
	
	@PostMapping("/ingredient")
	public ModelAndView registIngredient(@Valid Ingredient ingredient, Errors errors, String mainSupplier) {
		if (errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("/ingredient/ingredientRegistForm");
			List<ObjectError> list = errors.getAllErrors();
			List<String> message = new ArrayList<String>();
			for (ObjectError error : list) {
				message.add(error.getDefaultMessage().toString());
			}
			mv.addObject("message", message);
			
            return mv;
		} else {
			ingredientServiceImpl.registIngredient(ingredient, mainSupplier);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/aos/ingredient");
		
		return modelAndView;
	}
	
	@GetMapping("/ingredient/{ingredientName}")
	public ModelAndView viewIngredient(@PathVariable String ingredientName) {
		ModelAndView modelAndView = new ModelAndView();
		Ingredient ingredient = ingredientServiceImpl.viewIngredient(ingredientName);
		String mainSupplier = ingredientServiceImpl.getMainSupplierName(ingredient.getName());
		modelAndView.addObject("ingredient", ingredient);
		modelAndView.addObject("mainSupplierName", mainSupplier);
		modelAndView.setViewName("/ingredient/ingredientView");
		
		return modelAndView;
	}
	
	@GetMapping("/ingredient/{name}/editform")
	public ModelAndView editIngredient(@PathVariable String name) {
		ModelAndView modelAndView = new ModelAndView();
		Ingredient ingredient = ingredientServiceImpl.viewIngredient(name);
		String mainSupplier = ingredientServiceImpl.getMainSupplierName(name);
		List<String> supplierList = ingredientServiceImpl.getSupplierList();
		modelAndView.addObject("ingredient", ingredient);
		modelAndView.addObject("mainSupplierName", mainSupplier);
		modelAndView.addObject("supplierList", supplierList);
		modelAndView.setViewName("/ingredient/ingredientEditForm");	
		
		return modelAndView;
	}
	
	@PutMapping("/ingredient")
	public ModelAndView editIngredient(@Valid Ingredient ingredient, Errors errors, String presentSupplier, String mainSupplier) {
		if (errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("redirect:/aos/ingredient");
			List<ObjectError> list = errors.getAllErrors();
			List<String> message = new ArrayList<String>();
			for (ObjectError error : list) {
				message.add(error.getDefaultMessage().toString());
			}
			mv.addObject("message", message);
			
            return mv;
		} else {
			ingredientServiceImpl.editIngredient(ingredient, presentSupplier, mainSupplier);			
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/aos/ingredient");
		
		return modelAndView;
	}
	
	@DeleteMapping("/ingredient")
	public ModelAndView deleteIngredient(String no) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/aos/ingredient");
		if (ingredientServiceImpl.deleteIngredient(no).equals("true")) {
			modelAndView.addObject("log", "정상적으로 삭제되었습니다.");			
		} else if (ingredientServiceImpl.deleteIngredient(no).equals("false")) {
			modelAndView.addObject("log", "현재 발주 상태인 식자재로 삭재가 불가합니다.");
		} else if (ingredientServiceImpl.deleteIngredient(no).equals("onTray")) {
			modelAndView.addObject("log", "해당 식자재가 트레이에 등록되어 있어서 삭제할 수 없습니다.");
		}
		
		return modelAndView;
	}
	
	@PostMapping(value = "/ingredientsearch", consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public List<Map<String, String>> searchIngredisent(String income) {
		List<Map<String, String>> searchResult = ingredientServiceImpl.searchIngredient(income);
		
		return searchResult;
	}
	
	@PostMapping("/ingredient/check")
	public boolean checkIngredient(String ingredientName) {
		boolean checkName = ingredientServiceImpl.checkIngredient(ingredientName);
		
		return checkName;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new IngredientValidator());
	}
}
