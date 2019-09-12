package com.debugking.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.MemberRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService serivce;
	@Autowired
	MemberRepository repo;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model) {
		
		
		return "Ok";
	}
	//화면이동
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){

		return "member/signup";

	}
	//회원 등록하기
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPro(MemberInfo member){
		int temp = serivce.signup(member);
		String result = "";
		switch(temp){
		case 1:
			System.out.println("안들어왔엉?");
			result = "success";
			break;
		case 0:
			System.out.println("안들어왔엉?실패야?");
			result = "fail";
			break;
		}
		return result;
	}
	
	@RequestMapping(value="/myblog", method=RequestMethod.GET)
	public String myblog(){
		return "myblog";
	}
	

	//ID체크 한명불러오기
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String memberId){
		MemberInfo result = repo.idCheck(memberId);
		if(result!=null){
			return "true";
		}
		else{
			return "false";
		}
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
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modify(){
		return"member/modify";
	}
	
	@RequestMapping(value="/follow_page", method=RequestMethod.GET)
	public String follow(){
		return"follow_page";
	}
}
