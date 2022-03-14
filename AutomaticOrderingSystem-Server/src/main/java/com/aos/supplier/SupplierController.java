package com.aos.supplier;

import java.util.ArrayList;
import java.util.Iterator;
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
public class SupplierController {
	@Autowired
	private SupplierServiceImpl supplierServiceImpl;

	@GetMapping("/supplier/registform")
	public ModelAndView registSupplier() {
		ModelAndView mav = new ModelAndView("/supplier/supplierRegistForm");
		mav.addObject("ingredientNameList", supplierServiceImpl.getIngredientList());

		return mav;
	}

	@PostMapping("/supplier")
	public ModelAndView registSupplier(@Valid Supplier supplier, Errors errors, String[] handlingIngredients) {
		ModelAndView mav = new ModelAndView();
		if (errors.hasErrors()) {
			List<ObjectError> errorList = errors.getAllErrors();
			List<String> errorMessages = new ArrayList<>();
			for (ObjectError error : errorList) {
				errorMessages.add(error.getDefaultMessage().toString());
			}
			mav.addObject("errorMessages", errorMessages);
			mav.setViewName("/supplier/supplierRegistForm");
			
			return mav;
		} else {
			supplierServiceImpl.registSupplier(supplier, handlingIngredients);
			mav.setViewName("redirect:/aos/supplier");
			
			return mav;
		}
		
	}

	@GetMapping("/supplier/{no}")
	public ModelAndView viewSupplier(@PathVariable String no) {
		ModelAndView mav = new ModelAndView("/supplier/supplierView");
		Supplier supplier = new Supplier();

		supplier.setNo(no);
		supplier = supplierServiceImpl.viewSupplier(supplier);
		Map<String, String> handlingIngredientList = supplierServiceImpl.handlingListBySupplierNo(supplier);
		String[] ingredients = new String[handlingIngredientList.size()];
		Iterator<String> keys = handlingIngredientList.keySet().iterator();
		int cnt = 0;
		while (keys.hasNext()) {
			String key = keys.next();
			ingredients[cnt] = handlingIngredientList.get(key);
			cnt++;
		}

		mav.addObject("supplier", supplier);
		mav.addObject("ingredients", ingredients);

		return mav;
	}

	@GetMapping("/supplier")
	public ModelAndView supplierList(String log,String errorMessages) {
		ModelAndView mav = new ModelAndView("/supplier/supplierList");
		mav.addObject("supplierList", supplierServiceImpl.supplierList());
		mav.addObject("log", log);
		mav.addObject("errorMessages", errorMessages);

		return mav;
	}

	@PostMapping(value = "/suppliersearch", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public List<Supplier> searchSupplier(String keyword) {
		return supplierServiceImpl.searchResultList(keyword);
	}

	@GetMapping("/supplier/{no}/editform")
	public ModelAndView editSupplier(@PathVariable String no) {
		ModelAndView mav = new ModelAndView("/supplier/supplierEditForm");
		Supplier supplier = new Supplier();
		supplier.setNo(no);

		supplier = supplierServiceImpl.viewSupplier(supplier);
		Map<String, String> handlingIngredientList = supplierServiceImpl.handlingListBySupplierNo(supplier);
		String[] ingredients = new String[handlingIngredientList.size()];
		Iterator<String> keys = handlingIngredientList.keySet().iterator();
		int cnt = 0;
		while (keys.hasNext()) {
			String key = keys.next();
			ingredients[cnt] = handlingIngredientList.get(key);
			cnt++;
		}
		mav.addObject("supplier", supplierServiceImpl.viewSupplier(supplier));
		mav.addObject("handlingIngredients", ingredients);
		mav.addObject("ingredientNameList", supplierServiceImpl.getIngredientList());

		return mav;
	}

	@PutMapping("/supplier")
	public ModelAndView editSupplier(@Valid Supplier supplier, Errors errors, String[] handlingIngredients) {
		ModelAndView mav = new ModelAndView("redirect:/aos/supplier");
		if (errors.hasErrors()) {
			List<ObjectError> errorList = errors.getAllErrors();
			List<String> errorMessages = new ArrayList<>();
			for (ObjectError error : errorList) {
				errorMessages.add(error.getDefaultMessage().toString());
			}
			mav.addObject("errorMessages", errorMessages);
		} else {
			supplierServiceImpl.editSupplier(supplier, handlingIngredients);
		}
		return mav;
	}

	@DeleteMapping("/supplier")
	public ModelAndView deleteSupplier(String no) {
		ModelAndView mav = new ModelAndView("redirect:/aos/supplier");
		Supplier supplier = new Supplier();
		supplier.setNo(no);
		if(supplierServiceImpl.deleteSupplier(supplier).equals("success")) {
			mav.addObject("log", true);
		} else {
			mav.addObject("log", false);
		}
		return mav;
	}

	@PostMapping("/supplier/check")
	public boolean checkSupplier(String name) {
		return supplierServiceImpl.checkSupplier(name);

	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new SupplierValidator());
	}
}
