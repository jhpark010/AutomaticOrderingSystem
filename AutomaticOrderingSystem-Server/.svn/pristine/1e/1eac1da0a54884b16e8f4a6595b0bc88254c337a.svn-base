package com.aos.serverio;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aos.requestorder.RequestOrderServiceImpl;

@RestController
@RequestMapping("/aos")
public class ServerIOController {
	@Autowired
	RequestOrderServiceImpl requestOrderServiceImpl;
	
	@PostMapping("/incomeorderweight")
	public ResponseMessage isOrder(HttpServletRequest request) throws Exception {
		int no = Integer.valueOf(request.getParameter("trayNo"));
		double weight = Double.valueOf(request.getParameter("weight"));
		
		ResponseMessage message = new ResponseMessage();
		
		if (no > 0 && weight > 0) {
			message.setNo(no + "");
			message.setStatus(requestOrderServiceImpl.registRequestOrderInfo(no, weight) + "");
			message.setMessage("200");
		} else {
			message.setNo(no + "");
			message.setStatus("false");
			message.setMessage("400");
		}
		return message;
	}
}
