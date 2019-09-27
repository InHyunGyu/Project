package com.debugking.www;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.FollowRepository;
import com.debugking.www.dto.Follower;
import com.debugking.www.dto.MemberInfo;

@Controller
public class FollowController {
	
	@Autowired
	FollowRepository repo;
	
	@ResponseBody
	@RequestMapping(value="/follower", method=RequestMethod.GET)
	public ArrayList<MemberInfo> follower(String memberId){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		
		list = repo.follower(memberId);
		System.out.println(list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/following", method=RequestMethod.GET)
	public ArrayList<MemberInfo> following(String memberId){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		
		list = repo.following(memberId);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/followBTN", method=RequestMethod.GET)
	public String followBTN(Follower follow){

		repo.insert(follow);
		
		return"dd";
	}
}
