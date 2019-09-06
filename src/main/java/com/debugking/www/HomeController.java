package com.debugking.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main";
	}
	
	@RequestMapping(value = "/file_list", method = RequestMethod.GET)
	public String file_list() {
		return "file_list";
	}
	
	@RequestMapping(value = "/file_detail", method = RequestMethod.GET)
	public String file_detail() {
		return "file_detail";
	}
	 
	
	
	
}
