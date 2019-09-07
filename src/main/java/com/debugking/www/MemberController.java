package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dto.Member;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repo;
	
	//화면이동
	@RequestMapping(value = "/signupmove", method = RequestMethod.GET)
	public String signup() {
		return "Member/signup";
	}
	
/*	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	@ResponseBody
	public String signup(Member member) {
		System.out.println(member);
		int result = repo.signup(member);
		if(result==1){
			return "success";
		}
		else{
			return "fail";
		}
		
	}*/
}
