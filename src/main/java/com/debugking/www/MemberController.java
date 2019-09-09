package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.MemberRepository;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repo;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model) {
		
		
		return "Ok";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){
		
		return "member/signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPro(){
		
		return "main";
	}
	
	@RequestMapping(value="/myblog", method=RequestMethod.GET)
	public String myblog(){
		return "myblog";
	}
	
	@RequestMapping(value="/id_pwd", method=RequestMethod.GET)
	public String id_pwd(){
		return "member/id_pwd";
	}
	
	@ResponseBody
	@RequestMapping(value="/findid", method=RequestMethod.POST)
	public String findid(){
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/findpwd", method=RequestMethod.POST)
	public String findpwd(){
		return "";
	}
}
