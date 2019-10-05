package com.debugking.www;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public Map<String, Object> follower(String memberId, String login){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		ArrayList<Follower> mem = new ArrayList<>();
		
		mem = repo.followlist(login);
		
		list = repo.follower(memberId);
		System.out.println(list);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("memList", mem);
		
		
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/following", method=RequestMethod.GET)
	public Map<String, Object> following(String memberId, String login){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		ArrayList<Follower> mem = new ArrayList<>();
		
		mem = repo.followlist(login);
		list = repo.following(memberId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("memList", mem);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/followBTN", method=RequestMethod.GET)
	public String followBTN(Follower follow){
		
		Follower temp = repo.selectOne(follow);
		
		if(temp == null) {
			repo.insert(follow);
			return "ok";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/block", method=RequestMethod.GET)
	public String block(Follower follow){
		
		Follower temp = repo.selectOne(follow);
		
		if(temp == null) {
			return "fail";
		} else {
			repo.delete(follow);
			return "ok";
		}
	}
}
