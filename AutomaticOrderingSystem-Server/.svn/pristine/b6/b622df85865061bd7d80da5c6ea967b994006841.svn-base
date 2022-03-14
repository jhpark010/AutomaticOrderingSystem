package com.aos.tray;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
public class TrayController {
	@Autowired
	TrayServiceImpl trayService;
	
	@GetMapping("/tray/registform")
	public ModelAndView registTray() throws Exception {
		ModelAndView mov = new ModelAndView();
		
		mov.addObject("trayList", trayService.getTrayNo());
		mov.addObject("ingredientList", trayService.ingredientList());
		mov.setViewName("/tray/trayRegistForm");
		
		return mov;
	}
	
	@PostMapping("/tray")
	public ModelAndView registTray(@Valid Tray tray, Errors errors) throws Exception {
		if (errors.hasErrors()) {
			ModelAndView mv = new ModelAndView("/tray/trayRegistForm");
			
			List<ObjectError> list = errors.getAllErrors();
			List<String> message = new ArrayList<String>();
			
			for (ObjectError error : list) {
				message.add(error.getDefaultMessage().toString());
			}
			
			mv.addObject("message", message);
			
            return mv;
		} else {
			trayService.registTray(tray);			
		}
		return new ModelAndView("redirect:/aos/tray");
	}
	
	@GetMapping("/tray/{no}")
	public ModelAndView viewTray(@PathVariable String no) throws Exception {
		Tray tray = new Tray();
		tray.setNo(no);
		
		ModelAndView mov = new ModelAndView();
		mov.addObject("tray", trayService.viewTray(tray));
		mov.setViewName("/tray/trayView");
		
		return mov;
	}
	
	@GetMapping("/tray")
	public ModelAndView trayList() throws Exception {
		ModelAndView mov = new ModelAndView();
		mov.addObject("trayList", trayService.trayList());
		mov.addObject("trayNo", trayService.getTrayNo().size());
		mov.setViewName("/tray/trayList");
		
		return mov;
	}
	
	@GetMapping("/tray/{no}/editform")
	public ModelAndView editTrayForm(@PathVariable String no) throws Exception {
		Tray tray = new Tray();
		tray.setNo(no);
		TrayInfo trayInfo = trayService.viewTray(tray);
		
		ModelAndView mov = new ModelAndView();
		mov.addObject("trayInfo", trayInfo);
		mov.setViewName("/tray/trayEditForm");
		
		return mov;
	}
	
	@PutMapping("/tray/{no}")
	public ModelAndView editTray(@PathVariable String no, Tray tray) throws Exception {
		trayService.editTray(tray);
		
		return new ModelAndView("redirect:/aos/tray");
	}
	
	@DeleteMapping("/tray/{no}")
	public boolean deleteTray(@PathVariable String no) throws Exception {
		Tray tray = new Tray();
		tray.setNo(no);
		
		return trayService.deleteTray(tray);
	}
	
	@PostMapping("/tray/check")
	public boolean isDuplicate(String no) throws Exception {
		boolean isDuplicate;
		
		if (!(no.isEmpty())) {
			isDuplicate = trayService.checkTray(no);
		} else {
			isDuplicate = false;
		}
		return isDuplicate;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new TrayValidator());
	}
}
