package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dto.MemberInfo;
import com.debugking.www.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService serivce;
	
	//화면이동
	@RequestMapping(value = "/signupmove", method = RequestMethod.GET)
	public String signup() {
		return "Member/signup";
	}
	
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
}
