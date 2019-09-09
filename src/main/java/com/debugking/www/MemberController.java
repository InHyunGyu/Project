package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService serivce;
	

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseBody
	public String signup(MemberInfo member) {
		System.out.println(member);
		int result = serivce.signup(member);
		if(result==1){
			return "success";
		}
		else{
			return "fail";
		}
	}
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model) {
		
		
		return "Ok";
	}
	//화면이동
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){
		
		return "signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPro(){
		
		return "main";
	}
	
	@RequestMapping(value="/myblog", method=RequestMethod.GET)
	public String myblog(){
		return "myblog";
	}
}
