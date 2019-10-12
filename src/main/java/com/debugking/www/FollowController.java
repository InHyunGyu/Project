package com.debugking.www;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.FollowRepository;
import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dto.Follower;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;


@Controller
public class FollowController {
	
	@Autowired
	FollowRepository repo;
   @Autowired
   ManagerRepository Managerrepo;
	
	@ResponseBody
	@RequestMapping(value="/follower", method=RequestMethod.GET)
	public Map<String, Object> follower(String memberId, String login, Model model){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		ArrayList<Follower> mem = new ArrayList<>();
		
		mem = repo.followlist(login);
		
		list = repo.follower(memberId);
		System.out.println(list);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("memList", mem);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/following", method=RequestMethod.GET)
	public Map<String, Object> following(String memberId, String login, Model model){
		
		ArrayList<MemberInfo> list = new ArrayList<>();
		ArrayList<Follower> mem = new ArrayList<>();
		
		
		list = repo.following(memberId);
		mem = repo.followlist(login);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("memList", mem);
		
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/followBTN", method=RequestMethod.GET)
	public String followBTN(Follower follow, Model model){
		
		Follower temp = repo.selectOne(follow);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		if(temp == null) {
			repo.insert(follow);
			return "ok";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/block", method=RequestMethod.GET)
	public String block(Follower follow, Model model){
		
		Follower temp = repo.selectOne(follow);
		
		int startRecord=0;
        int lastPerPage=3;   
        List<Posts> noticeList = Managerrepo.selectNotice(startRecord,lastPerPage);
        model.addAttribute("noticeList",noticeList);
        System.out.println("공지 목록: " + noticeList);
		
		if(temp == null) {
			return "fail";
		} else {
			repo.delete(follow);
			return "ok";
		}
	}
}
