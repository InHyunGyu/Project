package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.debugking.www.dao.MemberRepository;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repo;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		
		return "index";
	}
}
