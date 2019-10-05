package com.debugking.www;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.debugking.www.dao.ManagerRepository;
import com.debugking.www.dto.MemberInfo;
import com.debugking.www.dto.Posts;
import com.debugking.www.service.ManagerService;
import com.debugking.www.util.PageNavigator;

@Controller
public class ManagerController {
	@Autowired
	ManagerRepository repo;
	@Autowired
	ManagerService service;
	
	@RequestMapping(value="/managerPage", method=RequestMethod.GET)
	public String manager(
			@RequestParam(value="searchItem" , defaultValue="voice") String searchItem,
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		System.out.println("매니저 페이지 호출 ");
		int totalRecordCount = repo.getVoiceCount(searchItem);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		//System.out.println(navi.getStartRecord());
		List<Posts> list = repo.selectAll(searchItem, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("list", list);
		
		return "manager/managerPage";
	}
	//게시글 이동
	@RequestMapping(value="/move", method=RequestMethod.POST)
	@ResponseBody
	public int move(@RequestParam(value="listchecked") List<String> listchecked,String postType){
		System.out.println("postNo"+listchecked+"//////"+"postType"+postType);
		
		int result = service.move(listchecked,postType);
	
		return result;
	}
	
	
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public String notice_write(){
		return "manager/notice_write";
	}
	//게시글 삭제
	@RequestMapping(value="/deleted", method=RequestMethod.POST)
	@ResponseBody
	public int deleted(@RequestParam(value="listchecked") List<String> listchecked){
		int result = service.deleted(listchecked);
	
		return result;
	}
	
	@RequestMapping(value="/memberRating", method=RequestMethod.GET)
	@ResponseBody
	public List<MemberInfo> memberRating(
			@RequestParam(value="memberLevel" , defaultValue="beginner") String memberLevel,
			@RequestParam(value="currentPage", defaultValue="1")     int currentPage,
			Model model){
		int totalRecordCount = repo.getMemberInfoCount(memberLevel);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		
		//System.out.println(navi.getStartRecord());
		List<MemberInfo> ratingList = repo.selectMemberInfoAll(memberLevel, navi.getStartRecord(), navi.getCountPerPage());
		System.out.println("1234s"+ratingList);
		/*model.addAttribute("searchItem", memberLevel);
		model.addAttribute("navi", navi);
		model.addAttribute("ratingList", ratingList);*/
		
		return ratingList;
	}
	//등업하기 등급 변경하기
	@RequestMapping(value="/change", method=RequestMethod.POST)
	@ResponseBody
	public int change(@RequestParam(value="listchecked") List<String> listchecked,String changeLevel){
		System.out.println("postNo"+listchecked+"//////"+"postType"+changeLevel);
		
		int result = service.change(listchecked,changeLevel);
	
		return result;
	}
	
	
}
