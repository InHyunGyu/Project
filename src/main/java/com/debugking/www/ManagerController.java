package com.debugking.www;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {

	@RequestMapping(value="/managerPage", method=RequestMethod.GET)
	public String manager(){
		return "manager/managerPage";
	}
	
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public String notice_write(){
		return "manager/notice_write";
	}
}
