package com.debugking.www;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage (){
		
		return "member/login";
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public MemberInfo login(HttpSession session, MemberInfo member) {
		MemberInfo result = repo.login(member);
		if(result != null){
			session.setAttribute("memberId", result.getMemberId());
			session.setAttribute("memberName", result.getMemberName());
		}
		return result;
	}
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String signup(HttpSession session){
		session.removeAttribute("memberId");
		session.removeAttribute("memberName");
		return "redirect:/";

	}
	//회원탈퇴
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(HttpSession session, MemberInfo member){
		System.out.println("delete"+member);
		
		int result = repo.memberDelete(member);
		if(result == 1){
			session.removeAttribute("memberId");
			session.removeAttribute("memberName");
			return "redirect:/"; 
		}else{
			return "redirect:/";
		}
	}
	
	//화면이동
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(){

		return "member/signup";

	}
	//회원등록하기
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	@ResponseBody
	public String signupPro(MemberInfo member){
		int temp = serivce.signup(member);
		String result = "";
		switch(temp){
		case 1:
			result = "success";
			break;
		case 0:
			result = "fail";
			break;
		}
		return result;
	}
	
	@RequestMapping(value="/myblog", method=RequestMethod.GET)
	public String myblog(){
		return "member/myblog";
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
		return"member/follow_page";
	}
}
