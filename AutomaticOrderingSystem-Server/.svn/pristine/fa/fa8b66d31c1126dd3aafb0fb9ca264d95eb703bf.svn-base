package com.aos.requestorder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/aos")
public class RequestOrderController {
	@Autowired
	private RequestOrderServiceImpl requestOrderServiceImpl;
	
	@GetMapping("/requestorderinfo")
	public ModelAndView requestOrderList() {
		ModelAndView modelAndView = new ModelAndView();
		List<RequestOrderInfo> result = requestOrderServiceImpl.requestOrderList();
		modelAndView.setViewName("/requestorder/requestOrderList");
		modelAndView.addObject("data", result);
		return modelAndView;
	}
	
	@GetMapping("/requestorderinfo/{date}")
	public ModelAndView requestOrderList(@PathVariable String date) {
		ModelAndView modelAndView = new ModelAndView();
		RequestOrder requestOrder = new RequestOrder();
		requestOrder.setOrderDate(date);
		RequestOrderInfo result = requestOrderServiceImpl.viewRequestOrder(requestOrder);
		StoreInfo storeInfo = requestOrderServiceImpl.getStoreInfo();
		if (result == null) {
			modelAndView.setViewName("redirect:/errors");
			return modelAndView;
		}
		modelAndView.setViewName("/requestorder/requestOrderView");
		modelAndView.addObject("data", result);
		modelAndView.addObject("storeInfo", storeInfo);
		return modelAndView;
	}
	
	@GetMapping("/requestorderinfo/{date}/warehousing")
	public ModelAndView warehousingComplete(@PathVariable String date) {
		ModelAndView mav = new ModelAndView("redirect:/aos/requestorderinfo");
		requestOrderServiceImpl.editRequestOrderInfo(date);
		
		return mav; 
	}
	
	@PostMapping(value = "/requestorderinfo", consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE) // GET -> POST변경, 반환타입: List<Ingredient> -> Map<String, String> 변경
	public List<RequestOrderInfo> searchIngredisent(String income) {
		List<RequestOrderInfo> result = requestOrderServiceImpl.searchRequestOrder(income);
		return result;
	}
}
